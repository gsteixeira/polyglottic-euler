SHELL := /bin/bash

default: btree.c btree.go btree.cob btree.ts
	mkdir -p build
	go build -o build/go_btree btree.go
	gcc -o build/c_btree btree.c
	cobc -x --free -o build/cobol_btree btree.cob
	tsc --outFile build/typescript_btree.js btree.ts

run: build/c_btree build/go_btree build/cobol_btree btree.R
	@echo "in Go"
	./build/go_btree
	@echo "in Python"
	python3 btree.py
	@echo "in R"
	Rscript btree.R
	@echo "in C"
	./build/c_btree
	@echo "in Node.js"
	nodejs btree.js
	@echo "in Cobol"
	./build/cobol_btree
	@echo "in Typescript"
	nodejs ./build/typescript_btree.js

clean:
	rm -f ./build/*
