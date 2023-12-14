SHELL := /bin/bash

default: fibonacci.cob fibonacci.f90 fibonacci.c fibonacci.go
	mkdir -p build
	go build -o build/go_fibonacci fibonacci.go
	gfortran -o build/fortran_fibonacci fibonacci.f90
	cobc -x --free -o build/cobol_fibonacci fibonacci.cob
	gcc -o build/c_fibonacci fibonacci.c
	g++ -o build/cc_fibonacci fibonacci.cc
	tsc --outFile build/typescript_fibonacci.js fibonacci.ts

run: build/c_fibonacci build/cobol_fibonacci build/fortran_fibonacci build/go_fibonacci
	@echo "in Go"
	./build/go_fibonacci
	@echo "in Cobol"
	./build/cobol_fibonacci
	@echo "in Python"
	python fibonacci.py
	@echo "in Fortran"
	./build/fortran_fibonacci
	@echo "in C"
	./build/c_fibonacci
	@echo "in C++"
	./build/cc_fibonacci
	@echo "in R"
	Rscript fibonacci.R
	@echo "in Node.js"
	nodejs fibonacci.js
	@echo "in Typescript"
	nodejs ./build/typescript_fibonacci.js

clean:
	rm -f ./build/*
