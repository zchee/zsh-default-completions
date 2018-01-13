fetch: clean
	[ -d ./zsh ] && rm -rf ./zsh || true
	git clone --depth 1 --single-branch git://git.code.sf.net/p/zsh/code zsh
	cp -r zsh/Completion ./src
	rm -rf ./zsh

clean:
	rm -rf ./src
