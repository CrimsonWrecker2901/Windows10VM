FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Install necessary packages (e.g., qemu, virsh, etc.)
RUN apt-get update && apt-get install -y \
    qemu-system-x86 \
    libvirt-daemon-system \
    libvirt-clients \
    bridge-utils \
    && rm -rf /var/lib/apt/lists/*
