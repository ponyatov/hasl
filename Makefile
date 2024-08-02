# var
MODULE = $(notdir $(CURDIR))

# dirs
CWD = $(CURDIR)

# tool
CURL  = curl -L -o
CF    = clang-format -style=file -i
GHCUP = ghcup

# src
C += $(wildcard src/*.c*)
H += $(wildcard src/*.h*)
F += lib/$(MODULE).ini $(wildcard lib/*.f)
Z += $(wildcard src/*.hs)

# cfg
CFLAGS = -Iinc -Itmp

# all
.PHONY: all
all: bin/$(MODULE) $(F)
	$^

# format
.PHONY: format
format: tmp/format_cpp
tmp/format_cpp: $(C) $(H)
	$(CF) $? && touch $@

# rule
bin/$(MODULE): $(C) $(H)
	$(CXX) $(CFLAGS) -o $@ $(C) $(L)

# install
.PHONY: install update ref gz
install: ref gz $(GHCUP)
	$(MAKE) update
update:
	sudo apt update
	sudo apt install -uy `cat apt.txt`
ref:
gz:

$(GHCUP):
	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | \
		BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
		BOOTSTRAP_HASKELL_INSTALL_HLS=1 \
		BOOTSTRAP_HASKELL_ADJUST_BASHRC=Y \
		BOOTSTRAP_HASKELL_GHC_VERSION=latest \
		BOOTSTRAP_HASKELL_CABAL_VERSION=latest \
			sh

# 			BOOTSTRAP_HASKELL_INSTALL_STACK=1 
# 	sh -s - install ghcup
# # BOOTSTRAP_HASKELL_MINIMAL=1
# curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
