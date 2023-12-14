SHELL := /bin/bash

SOURCE := btree

default: $(SOURCE).c $(SOURCE).cc $(SOURCE).go $(SOURCE).cob $(SOURCE).ts
	mkdir -p build
	go build -o build/go_$(SOURCE) $(SOURCE).go
	gcc -o build/c_$(SOURCE) $(SOURCE).c
	g++ -o build/cc_$(SOURCE) $(SOURCE).cc
	cobc -x --free -o build/cobol_$(SOURCE) $(SOURCE).cob
	tsc --outFile build/typescript_$(SOURCE).js $(SOURCE).ts

run: build/c_$(SOURCE) build/go_$(SOURCE) build/cobol_$(SOURCE) $(SOURCE).R
	@echo "in Go"
	./build/go_$(SOURCE)
	@echo "in Python"
	python $(SOURCE).py
	@echo "in R"
	Rscript $(SOURCE).R
	@echo "in C"
	./build/c_$(SOURCE)
	@echo "in C++"
	./build/cc_$(SOURCE)
	@echo "in Node.js"
	nodejs $(SOURCE).js
	@echo "in Cobol"
	./build/cobol_$(SOURCE)
	@echo "in Typescript"
	nodejs ./build/typescript_$(SOURCE).js

clean:
	rm -f ./build/*
