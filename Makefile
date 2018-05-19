fetch: clean
	@[ -d ./zsh ] && rm -rf ./zsh || true
	@git clone --depth 1 --branch master --single-branch git://git.code.sf.net/p/zsh/code zsh
	@echo "commit:"
	git -C zsh rev-parse --verify HEAD
	@cp -r zsh/Completion ./src
	@rm -rf ./zsh

clean:
	@rm -rf ./src
