#!/bin/bash
echo "Setting up Windows 10 VM... (This is a placeholder)"
qemu-img create -f qcow2 /path/to/windows10.img 50G
qemu-system-x86_64 \
    -enable-kvm \
    -m 4096 \
    -smp 4 \
    -machine type=pc,accel=kvm \
    -drive file=/path/to/windows10.img,format=qcow2,if=virtio \
    -cdrom /path/to/Win10_XX_X64.iso \
    -boot d \
    -netdev user,id=mynet0 -device virtio-net-pci,netdev=mynet0 \
    -vga std \
    -usb -device usb-tablet \
    -name "Windows 10 VM"
    -cdrom /path/to/virtio.iso
    qemu-system-x86_64 \
    -enable-kvm \
    -m 4096 \
    -smp 4 \
    -machine type=pc,accel=kvm \
    -drive file=/path/to/windows10.img,format=qcow2,if=virtio \
    -netdev user,id=mynet0 -device virtio-net-pci,netdev=mynet0 \
    -vga std \
    -usb -device usb-tablet \
    -name "Windows 10 VM"
