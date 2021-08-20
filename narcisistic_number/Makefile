SHELL := /bin/bash

default: narcise_gen.cob narcise_gen.f90 narcise_gen.c narcise_gen.go
	mkdir -p build
	go build -o build/go_narcise_gen narcise_gen.go
	gfortran -o build/fortran_narcise_gen narcise_gen.f90
	cobc -x --free -o build/cobol_narcise_gen narcise_gen.cob
	gcc -lm -o build/c_narcise_gen narcise_gen.c

run: build/c_narcise_gen build/cobol_narcise_gen build/fortran_narcise_gen build/go_narcise_gen
	@echo "in Go"
	./build/go_narcise_gen
	@echo "in Cobol"
	./build/cobol_narcise_gen
	@echo "in Python"
	python3 narcise_gen.py
	@echo "in Fortran"
	./build/fortran_narcise_gen
	@echo "in C"
	./build/c_narcise_gen
	@echo "in R"
	Rscript narcise_gen.R

clean:
	rm -f ./build/*
