CHEMACS_DIR?=~/.chemacs
DOOM_DIR?=~/.doom-emacs
SPACEMACS_DIR?=~/.spacemacs

emacs-targets = \
	chemacs \
	chemacs-profiles \
	doom \
	emacs-doom-dotfiles \
	spacemacs \
	emacs-spacemacs-dotfiles \
	emacs-vanilla-dotfiles \
	emacs-yasnippet

all: $(emacs-targets) git vim yabai

.PHONY: chemacs
chemacs:
	@if [ ! -d $(CHEMACS_DIR) ]; then \
	  echo "$(CHEMACS_DIR) does not exist, cloning repo..."; \
	  git clone https://github.com/plexus/chemacs.git $(CHEMACS_DIR); \
	  cd ~; .chemacs/install.sh; \
	fi

chemacs-profiles: chemacs-profiles.org
	bin/tangle chemacs-profiles.org

.PHONY: doom
doom:
	@if [ ! -d $(DOOM_DIR) ]; then \
	  echo "$(DOOM_DIR) does not exist, cloning repo..."; \
	  git clone --depth 1 https://github.com/hlissner/doom-emacs $(DOOM_DIR); \
	fi

emacs-doom-dotfiles: emacs-doom.org
	bin/tangle emacs-doom.org

.PHONY: spacemacs
spacemacs:
	@if [ ! -d $(SPACEMACS_DIR) ]; then \
	  echo "$(SPACEMACS_DIR) does not exist, cloning repo..."; \
	  git clone https://github.com/syl20bnr/spacemacs $(SPACEMACS_DIR); \
	fi

emacs-spacemacs-dotfiles: emacs-spacemacs.org
	bin/tangle emacs-spacemacs.org

emacs-vanilla-dotfiles: emacs-vanilla.org
	bin/tangle emacs-vanilla.org

emacs-yasnippet: emacs-yasnippet.org
	bin/tangle emacs-yasnippet.org

git: git.org
	bin/tangle git.org

vim: vim.org
	bin/tangle vim.org

yabai: yabai.org
	bin/tangle yabai.org

run: all
	for f in sh/*.sh; do \
		echo "Running: $$f"; \
		zsh -l $$f; \
	done

install: run
