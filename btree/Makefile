SHELL := /bin/bash

default: btree.c btree.go
	mkdir -p build
	go build -o build/go_btree btree.go
	gcc -o build/c_btree btree.c

run: build/c_btree build/go_btree
	@echo "in Go"
	./build/go_btree
	@echo "in Python"
	python3 btree.py
	@echo "in C"
	./build/c_btree

clean:
	rm -f ./build/*
