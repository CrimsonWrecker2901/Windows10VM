#!/bin/bash

# Check if required tools are installed
if ! command -v qemu-system-x86_64 &> /dev/null
then
    echo "QEMU is not installed. Please install QEMU before running this script."
    exit 1
fi

# Configuration variables
DISK_IMAGE="windows10.img"
ISO_PATH="Win10_XX_X64.iso"
RAM="4096"     # 4 GB of RAM
CPUS="4"       # 4 CPU cores

# Create a disk image file
echo "Creating disk image..."
qemu-img create -f qcow2 ${DISK_IMAGE} 50G

# Launch the Windows 10 installation VM
echo "Starting the Windows 10 VM..."
qemu-system-x86_64 \
    -enable-kvm \
    -m ${RAM} \
    -smp ${CPUS} \
    -machine type=pc,accel=kvm \
    -drive file=${DISK_IMAGE},format=qcow2,if=virtio \
    -cdrom ${ISO_PATH} \
    -boot d \
    -netdev user,id=mynet0 -device virtio-net-pci,netdev=mynet0 \
    -vga std \
    -usb -device usb-tablet \
    -name "Windows 10 VM"

echo "VM started. Follow the installation prompts in the QEMU window."
