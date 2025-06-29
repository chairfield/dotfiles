CHEMACS_DIR?=~/.emacs.d
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
	emacs-vanilla-dotfiles

all: $(emacs-targets) alacritty git i3 keyboard hammerspoon vim x11 yabai zsh

.PHONY: chemacs
chemacs:
	@if [ ! -d $(CHEMACS_DIR) ]; then \
	  echo "$(CHEMACS_DIR) does not exist, cloning repo..."; \
	  git clone https://github.com/plexus/chemacs2.git ~/.emacs.d; \
	fi

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

alacritty: alacritty.org
	bin/tangle alacritty.org

git: git.org
	bin/tangle git.org

i3: i3.org
	bin/tangle i3.org

keyboard: keyboard.org
	bin/tangle keyboard.org

hammerspoon: hammerspoon.org keyboard
	bin/tangle hammerspoon.org

vim: vim.org
	bin/tangle vim.org

x11: x11.org
	bin/tangle x11.org

yabai: yabai.org
	bin/tangle yabai.org

# If antigen-related changes aren't having an effect, try: antigen reset
zsh: zsh.org
	bin/tangle zsh.org

run: all
	for f in sh/*.sh; do \
		echo "Running: $$f"; \
		zsh -l $$f; \
	done

install: run
