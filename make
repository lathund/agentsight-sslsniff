ARCH = $(shell uname -m | sed 's/x86_64/x86/' | sed 's/aarch64/arm64/')
bpftool btf dump file ${1:-/sys/kernel/btf/vmlinux} format c
gcc sslsniff.c sslsniff.skel.h -lbpf -lc -lelf -lz -lbcc_bpf btf_helpers.c -lelf trace_helpers.c uprobe_helpers.c
clang -O2 -g -target bpf -D __TARGET_ARCH_x86 sslsniff.bpf.c
bpftool gen skeleton sslsniff.bpf.o > sslsniff.skel.h
