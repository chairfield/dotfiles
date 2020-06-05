run: all
	for f in sh/*.sh; do \
		echo "Running: $$f"; \
		zsh -l $$f; \
	done

install: run
