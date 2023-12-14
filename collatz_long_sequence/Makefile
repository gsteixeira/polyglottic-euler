SHELL := /bin/bash
SOURCE := collatz

default: $(SOURCE).cob $(SOURCE).f90 $(SOURCE).c $(SOURCE).go $(SOURCE).cc
	mkdir -p build
	go build -o build/go_$(SOURCE) $(SOURCE).go
	gfortran -o build/fortran_$(SOURCE) $(SOURCE).f90
	cobc -x --free --debug -o build/cobol_$(SOURCE) $(SOURCE).cob
	gcc -o build/c_$(SOURCE) $(SOURCE).c
	g++ -o build/cc_$(SOURCE) $(SOURCE).cc
	tsc --outFile build/typescript_$(SOURCE).js $(SOURCE).ts

run: build/c_$(SOURCE) build/cobol_$(SOURCE) build/fortran_$(SOURCE) build/go_$(SOURCE)
	@echo "in Go"
	./build/go_$(SOURCE)
	@echo "in Cobol"
	./build/cobol_$(SOURCE)
	@echo "in Python"
	python $(SOURCE).py
	@echo "in Fortran"
	./build/fortran_$(SOURCE)
	@echo "in C"
	./build/c_$(SOURCE)
	@echo "in C++"
	./build/cc_$(SOURCE)
	@echo "in R"
	Rscript $(SOURCE).R
	@echo "in Node.js"
	nodejs $(SOURCE).js
	@echo "in Typescript"
	nodejs ./build/typescript_$(SOURCE).js

clean:
	rm -f ./build/*
