#!/bin/bash
# Script d'installation et montage NFS Client
# À exécuter sur VM1-MGT et VM2-APP

echo "=== Installation NFS Client ==="
sudo apt update
sudo apt install -y nfs-common

echo "=== Création Point de Montage ==="
sudo mkdir -p /mnt/shared-storage

echo "=== Configuration Auto-Montage ==="
echo "192.168.100.30:/mnt/nfs-shared /mnt/shared-storage nfs defaults 0 0" | sudo tee -a /etc/fstab

echo "=== Montage NFS ==="
sudo mount -a

echo "=== Vérification ==="
df -h | grep nfs

echo "✓ NFS Client configuré avec succès !"