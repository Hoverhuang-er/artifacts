VERSION := $(shell git describe --tags --always --dirty)
all: package

package:
	@echo "Build Helm Package"
	helm lint charts/*
	helm package charts/*
	helm index --url https://hoverhuang.github.io/helm-charts/ .

tag:
	@echo "Tagging"
	git add . && git commit -m "Release $(VERSION)"
	git tag -a $(VERSION) -m "Release $(VERSION)" -f
	git push --tags