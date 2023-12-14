SHELL := /bin/bash

default: primes.cob primes.f90 primes.c primes.go
	mkdir -p build
	go build -o build/go_primes primes.go
	gfortran -o build/fortran_primes primes.f90
	cobc -x --free --debug -o build/cobol_primes primes.cob
	gcc -o build/c_primes primes.c
	g++ -o build/c++_primes primes.cc
	tsc --outFile build/typescript_primes.js primes.ts

run: build/c_primes build/cobol_primes build/fortran_primes build/go_primes
	@echo "in Go"
	./build/go_primes
	@echo "in Cobol"
	./build/cobol_primes
	@echo "in Python"
	python primes.py
	@echo "in Fortran"
	./build/fortran_primes
	@echo "in C"
	./build/c_primes
	@echo "in C++"
	./build/c++_primes
	@echo "in R"
	Rscript primes.R
	@echo "in Javascript"
	nodejs primes.js
	@echo "in Typescript"
	nodejs ./build/typescript_primes.js

clean:
	rm -f ./build/*
