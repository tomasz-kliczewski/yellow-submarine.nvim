gen:
	@rm -rf lua
	@rm -rf colors
	@colorgen-nvim ring0-dark.toml
	@mv ring0-dark/* ./
	@rmdir ring0-dark

setup:
	@cargo install colorgen-nvim
