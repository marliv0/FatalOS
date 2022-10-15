#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/fatalos.kernel isodir/boot/fatalos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "fatalos" {
	multiboot /boot/fatalos.kernel
}
EOF
grub-mkrescue -o fatalos.iso isodir
