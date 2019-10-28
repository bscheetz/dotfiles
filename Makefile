.PHONY: build run-docker

build:
	docker build --tag dotfiles .

run-docker:
	docker run -it -v ${CURDIR}:/dotfiles dotfiles
