default: init build
.PHONY: build

init:
	npm install html-minifier -g
build: clean
	mkdir build
	html-minifier \
		--collapse-whitespace \
		--remove-comments \
		--remove-optional-tags \
		--remove-redundant-attributes \
		--remove-script-type-attributes \
		--remove-tag-whitespace \
		--use-short-doctype \
		--minify-css true \
		--minify-js true \
		< src/index.html > build/index.html
clean:
	rm -r build