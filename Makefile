all: git vim yabai

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
