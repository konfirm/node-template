lab := node_modules/.bin/lab

.PHONY: clean test outdated best-practise

all:
	${MAKE} clean test

best-practise: LICENSE README.md

node_modules: package.json
	@npm install
	@touch node_modules

outdated: package.json
	@npm outdated

test: node_modules
	@${lab} -vclr

test-report: node_modules
	@${lab} -clr html -o report.html; open report.html

push:
	@git push origin HEAD --tags

release-patch: test best-practise outdated
	@npm version patch
	@{MAKE} push

release-feature: test best-practise outdated
	@npm version minor
	@{MAKE} push

release-breaking: test best-practise outdated
	@npm version major
	@{MAKE} push

publish:
	@npm publish --access public
