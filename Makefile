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

# src
C += $(wildcard src/*.c*)
H += $(wildcard src/*.h*)
F += lib/$(MODULE).ini $(wildcard lib/*.f)
Z += $(wildcard src/*.hs)

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
run: bin/hello $(F)
	$^

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
	doc/WYAH.pdf
doc/%: ~/doc/Haskell/%
	ln -fs $< $@

# install
.PHONY: install update ref gz
install: ref gz doc keys
	$(MAKE) update ghc
update: keys
	sudo apt update
	sudo apt install -uy `cat apt.txt`
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
		BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
		BOOTSTRAP_HASKELL_INSTALL_HLS=1 \
		BOOTSTRAP_HASKELL_ADJUST_BASHRC=Y \
		BOOTSTRAP_HASKELL_GHC_VERSION=latest \
		BOOTSTRAP_HASKELL_CABAL_VERSION=latest \
			sh

# BOOTSTRAP_HASKELL_INSTALL_STACK=1
# BOOTSTRAP_HASKELL_MINIMAL=1
