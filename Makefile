
all:
	@echo "Available targets:"
	@echo "  emacs: install emacs config"
	@echo "  zsh  : install zsh config"
	@echo "  bash : install bash config"

emacs:
	pushd . && cd emacs-config && make install && popd

zsh:
	pushd . && cd zsh && make install && popd

bash:
	pushd . && cd bash && make install && popd
