SHELL := /bin/bash

default: decompose.c decompose.go
	mkdir -p build
	go build -o build/go_decompose decompose.go
	gcc -o build/c_decompose decompose.c

run: build/c_decompose build/go_decompose decompose.R decompose.py
	@echo "in Go"
	./build/go_decompose
	@echo "in Python"
	python3 decompose.py
	@echo "in C"
	./build/c_decompose
	@echo "in R"
	Rscript decompose.R

clean:
	rm -f ./build/*
