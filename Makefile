.DEFAULT_GOAL = all

all: zsh src magic commit clean/zsh


zsh: clean/zsh
	git clone --depth 1 --branch master --single-branch https://git.code.sf.net/p/zsh/code zsh

src: clean/src
	cp -rH zsh/Completion ./src

magic: src
	find ./src -type f | xargs -I{} -P $(shell nproc) bash -c "printf '\\n# vim:ft=zsh' >> {}"

.PHONY: commit
commit:
	git add ./src && git commit -S -m "zsh: update to zsh-users/zsh@$$(git -C ./zsh rev-parse --verify HEAD)" && git push origin master || true


.PHONY: clean
clean: clean/src clean/zsh

.PHONY: clean/src
clean/src:
	@rm -rf ./src

.PHONY: clean/zsh
clean/zsh:
	@rm -rf ./zsh
