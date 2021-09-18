SHELL := /bin/bash

default: collatz.cob collatz.f90 collatz.c collatz.go
	mkdir -p build
	go build -o build/go_collatz collatz.go
	gfortran -o build/fortran_collatz collatz.f90
	cobc -x --free --debug -o build/cobol_collatz collatz.cob
	gcc -o build/c_collatz collatz.c
	tsc --outFile build/typescript_collatz.js collatz.ts

run: build/c_collatz build/cobol_collatz build/fortran_collatz build/go_collatz
	@echo "in Go"
	./build/go_collatz
	@echo "in Cobol"
	./build/cobol_collatz
	@echo "in Python"
	python3 collatz.py
	@echo "in Fortran"
	./build/fortran_collatz
	@echo "in C"
	./build/c_collatz
	@echo "in R"
	Rscript collatz.R
	@echo "in Node.js"
	nodejs collatz.js
	@echo "in Typescript"
	nodejs ./build/typescript_collatz.js

clean:
	rm -f ./build/*
