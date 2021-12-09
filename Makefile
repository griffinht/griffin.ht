default: init build
.PHONY: build # otherwise Make will relate the build target to the build output directory and won't run the build target

# install build dependencies
init:
	./init.sh
# spin up docker image of nginx at http://localhost:8080 and watch src/ to rebuild on changes
# you will probably also want to disable browser cache
develop: build
	./develop.sh
build:
	rm -rf build/*
	mkdir -p build
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
docker:
        docker build . --tag stzups/griffin.ht:latest

