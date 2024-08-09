# var
MODULE = $(notdir $(CURDIR))

# dirs
CWD = $(CURDIR)
INC = $(CWD)/inc
SRC = $(CWD)/src
TMP = $(CWD)/tmp
GZ  = $(HOME)/gz
GH  = $(HOME)/.ghcup/bin

# tool
CURL  = curl -L -o
CF    = clang-format -style=file -i
GHCUP = $(GH)/ghcup
GHC   = $(GH)/ghc
CABAL = $(GH)/cabal

# src
C += $(wildcard src/*.c*)
H += $(wildcard src/*.h*)
F += lib/$(MODULE).ini $(wildcard lib/*.f)
Z += $(wildcard app/*.hs)

# cfg
CFLAGS  = -I$(INC) -I$(TMP)
GHFLAGS = -odir=$(TMP) -hidir=$(TMP)
# -no-keep-o-files -no-keep-hi-files

# all
.PHONY: all
all: bin/$(MODULE) $(F)
	$^

# run
.PHONY: run
run: $(Z) $(F)
	$(CABAL) run $(MODULE) -- $(F)

# tut
.PHONY: tut
tut: $(Z) $(F)
	app/tutorial.hs

# format
.PHONY: format
format: tmp/format_cpp
tmp/format_cpp: $(C) $(H)
	$(CF) $? && touch $@

# rule
bin/$(MODULE): $(C) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)
bin/%: src/%.hs Makefile
	$(GHC) $(GHFLAGS) -o $@ $(Z)

# doc
.PHONY: doc
doc: \
	doc/WYAH.pdf doc/ohaskell.pdf doc/Write_Yourself_a_Scheme_in_48_Hours.pdf \
	doc/Programming_in_Haskell_-_Graham_Hutton.pdf
doc/%: ~/doc/Haskell/%
	ln -fs $< $@

~/doc/Haskell/WYAH.pdf:
	$(CURL) $@ https://smunix.github.io/dev.stephendiehl.com/fun/WYAH.pdf
~/doc/Haskell/ohaskell.pdf:
	$(CURL) $@ https://www.ohaskell.guide/pdf/ohaskell.pdf
~/doc/Haskell/Write_Yourself_a_Scheme_in_48_Hours.pdf:
	$(CURL) $@ https://upload.wikimedia.org/wikipedia/commons/a/aa/Write_Yourself_a_Scheme_in_48_Hours.pdf

# install
.PHONY: install update ref gz
install: ref gz doc keys
	$(MAKE) update
update: keys
	sudo apt update
	sudo apt install -uy `cat apt.txt`
	$(MAKE) ghc
ref:
gz:

.PHONY: keys
keys: \
	/etc/apt/sources.list.d/microsoft-prod.list \
	/etc/apt/trusted.gpg.d/microsoft.asc
/etc/apt/sources.list.d/microsoft-prod.list: $(GZ)/packages-microsoft-prod.deb
	sudo dpkg -i $< && sudo touch $@
$(GZ)/packages-microsoft-prod.deb:
	$(CURL) $@ https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb
/etc/apt/trusted.gpg.d/microsoft.asc:
	sudo $(CURL) $@ https://packages.microsoft.com/keys/microsoft.asc

$(GHCUP):
	$(MAKE) ghc
.PHONY: ghc
ghc:
	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | \
		BOOTSTRAP_HASKELL_NONINTERACTIVE=1     \
		BOOTSTRAP_HASKELL_INSTALL_HLS=1        \
		BOOTSTRAP_HASKELL_INSTALL_STACK=1      \
		BOOTSTRAP_HASKELL_GHC_VERSION=latest   \
		BOOTSTRAP_HASKELL_CABAL_VERSION=latest \
		BOOTSTRAP_HASKELL_STACK_VERSION=latest \
			sh
# BOOTSTRAP_HASKELL_ADJUST_BASHRC=Y
