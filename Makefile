.DEFAULT_TARGET: help
.PHONY: build docs example

help:
	@echo "Package Makefile"

outdated:
	dart pub outdated

upgrade:
	dart pub upgrade

build:
	dart run build_runner build --delete-conflicting-outputs
	dart fix --apply
	dart format lib/*
	dart pub get

docs:
	dart doc --validate-links --output build/docs

example:
	rm -rf build
	dart run example/openapi_spec_example.dart