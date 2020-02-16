dev:
	elm-live ./src/Main.elm --start-page=./tmp/index.html -- --output=./tmp/index.html --debug

build:
	cp ./tmp/index.html ./dist/index.html
	elm make ./src/Main.elm --output=./dist/Main.js --optimize
	uglifyjs ./dist/Main.js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' \
            | uglifyjs --mangle --output=./dist/Main.js


build-with-debug:
	cp ./tmp/index.html ./dist/index.html
	elm make ./src/Main.elm --output=./dist/Main.js --debug
	uglifyjs ./dist/Main.js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' \
            | uglifyjs --mangle --output=./dist/Main.js
