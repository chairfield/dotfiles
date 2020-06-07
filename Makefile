CHEMACS_DIR?=~/.chemacs

all: chemacs chemacs-profiles emacs-vanilla git vim yabai

.PHONY: chemacs
chemacs:
	@if [ ! -d $(CHEMACS_DIR) ]; then \
	  echo "$(CHEMACS_DIR) does not exist, cloning repo..."; \
	  git clone https://github.com/plexus/chemacs.git $(CHEMACS_DIR); \
	  cd ~; .chemacs/install.sh; \
	fi

chemacs-profiles: chemacs-profiles.org
	bin/tangle chemacs-profiles.org

emacs-vanilla: emacs-vanilla.org
	bin/tangle emacs-vanilla.org

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
