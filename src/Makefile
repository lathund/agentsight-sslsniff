ARCH = $(shell uname -m | sed 's/x86_64/x86/' | sed 's/aarch64/arm64/')

%.bpf.o: %.bpf.c vmlinux.h
	clang -target bpf -D __TARGET_ARCH_$(ARCH) -Wall -O2 -g -o $@ -c $<
	llvm-strip -g $@
