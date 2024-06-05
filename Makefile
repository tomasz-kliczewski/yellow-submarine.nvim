gen:
	@rm -rf lua
	@rm -rf colors
	@colorgen-nvim ring0-dark.toml
	@mv ring0dark/* ./
	@rmdir ring0dark

setup:
	@cargo install colorgen-nvim

git:
	@git add .
	@git commit -m "change colors"
	@git push
