VERSION ?= edge

CFLAGS = -c -g -D $(VERSION)

help:
	# @echo "  deps        install dependencies"
	# @echo "  test        runs tests"
	@echo "  compile, c     sets up your js files for production"
	@echo "  serve       run the webserver"

# deps:
# 	npm install
#
# test:
# 	npm test

compile:
	./node_modules/browserify/bin/cmd.js js/main.js -d -o dist/skifree.js
	./node_modules/uglify-js/bin/uglifyjs dist/skifree.js -c > dist/skifree.min.js

c:
	./node_modules/browserify/bin/cmd.js js/main.js -d -o dist/skifree.js
	./node_modules/uglify-js/bin/uglifyjs dist/skifree.js -c > dist/skifree.min.js

serve:
	ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 3000, :DocumentRoot => Dir.pwd).start'

# copy:
# 	cp *.png index.html $(COPY_TO)
# 	cp -R css dist vendor $(COPY_TO)

# compile:
# 	browserify js/main.js -d -o dist/skifree.js
# 	uglifyjs dist/skifree.js -d -c > dist/skifree.min.js
