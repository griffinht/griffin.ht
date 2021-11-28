default: init build
.PHONY: build # otherwise Make will relate the build target to the build output directory and won't run the build target

init:
	# html-minifier installed already?
	if command -v html-minifier; then \
		exit 0; \
	fi; \
	# root user?
	if [[ $(id -u) -ne 0 ]]; then \
  		npm install html-minifier -g; \
	else \
		sudo npm install html-minifier -g; \
	fi
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
	rm -rf build
develop:
	docker run --rm -v "$(shell pwd)"/build:/usr/share/nginx/html:ro --publish 8080:80 nginx