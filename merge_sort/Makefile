SHELL := /bin/bash

SOURCE := merge_sort

default: $(SOURCE).c $(SOURCE).go $(SOURCE).cob $(SOURCE).ts
	mkdir -p build
	go build -o build/go_$(SOURCE) $(SOURCE).go
	gcc -o build/c_$(SOURCE) $(SOURCE).c
	gfortran -o build/fortran_$(SOURCE) $(SOURCE).f90
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
	@echo "in Javascript"
	nodejs $(SOURCE).js
	@echo "in Fortran"
	./build/fortran_$(SOURCE)
	@echo "in Cobol"
	./build/cobol_$(SOURCE)
	@echo "in Typescript"
	nodejs ./build/typescript_$(SOURCE).js

clean:
	rm -f ./build/*
