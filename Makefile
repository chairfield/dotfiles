all: git yabai

git: git.org
	bin/tangle git.org

yabai: yabai.org
	bin/tangle yabai.org

run: all
	for f in sh/*.sh; do \
		echo "Running: $$f"; \
		zsh -l $$f; \
	done

install: run
