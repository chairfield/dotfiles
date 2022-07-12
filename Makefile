DOOM_DIR?=~/.doom-emacs
SPACEMACS_DEV_DIR?=~/.spacemacs-dev
SPACEMACS_MAIN_DIR?=~/.spacemacs-main

emacs-targets = \
	chemacs \
	chemacs-profiles \
	doom \
	emacs-doom-dotfiles \
	spacemacs-dev \
	emacs-spacemacs-dev-dotfiles \
	spacemacs-main \
	emacs-spacemacs-main-dotfiles \
	emacs-vanilla-dotfiles \
	emacs-yasnippet

all: $(emacs-targets) git vim yabai

.PHONY: chemacs
chemacs:
  @git clone https://github.com/plexus/chemacs2.git ~/.emacs.d \

chemacs-profiles: chemacs-profiles.org
	bin/tangle chemacs-profiles.org

.PHONY: doom
doom:
	@if [ ! -d $(DOOM_DIR) ]; then \
	  echo "$(DOOM_DIR) does not exist, cloning repo..."; \
	  git clone --depth 1 https://github.com/doomemacs/doomemacs $(DOOM_DIR); \
	fi

emacs-doom-dotfiles: emacs-doom.org
	bin/tangle emacs-doom.org

.PHONY: spacemacs-dev
spacemacs-dev:
	@if [ ! -d $(SPACEMACS_DEV_DIR) ]; then \
	  echo "$(SPACEMACS_DEV_DIR) does not exist, cloning repo..."; \
	  git clone -b develop https://github.com/syl20bnr/spacemacs $(SPACEMACS_DEV_DIR); \
	fi

emacs-spacemacs-dev-dotfiles: emacs-spacemacs-dev.org
	bin/tangle emacs-spacemacs-dev.org

.PHONY: spacemacs-main
spacemacs-main:
	@if [ ! -d $(SPACEMACS_MAIN_DIR) ]; then \
	  echo "$(SPACEMACS_MAIN_DIR) does not exist, cloning repo..."; \
	  git clone https://github.com/syl20bnr/spacemacs $(SPACEMACS_MAIN_DIR); \
	fi

emacs-spacemacs-main-dotfiles: emacs-spacemacs-main.org
	bin/tangle emacs-spacemacs-main.org

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
