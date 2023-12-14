SHELL := /bin/bash

SOURCE := insertion_sort

default: $(SOURCE).c $(SOURCE).go $(SOURCE).cob
	mkdir -p build
	go build -o build/go_$(SOURCE) $(SOURCE).go
	gcc -o build/c_$(SOURCE) $(SOURCE).c
	g++ -o build/cc_$(SOURCE) $(SOURCE).cc
	cobc -x --free -o build/cobol_$(SOURCE) $(SOURCE).cob

run: build/c_$(SOURCE) build/go_$(SOURCE) build/cobol_$(SOURCE)
	@echo "in Go"
	./build/go_$(SOURCE)
	@echo "in Python"
	python $(SOURCE).py
	@echo "in C"
	./build/c_$(SOURCE)
	@echo "in C++"
	./build/cc_$(SOURCE)
	@echo "in Cobol"
	./build/cobol_$(SOURCE)

clean:
	rm -f ./build/*
