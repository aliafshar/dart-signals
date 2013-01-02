# Copyright (c) Google Inc, 2012
# Author: afshar@google.com (Ali Afshar)

DARTDOC = /usr/local/dart/dart-sdk/bin/dartdoc

builddoc:
	${DARTDOC} lib/signals.dart
	git commit -a -m "Generated docs."
	git push origin master

pushdoc: builddoc
	git push origin --delete gh-pages
	git co --orphan gh-pages
	git rm -rf .gitignore lib test Makefile pubspec.yaml README.md
	git commit -m "Docs"
	git push origin gh-pages
	git co master
	git branch -D gh-pages
	git commit -a -m "Generated docs."