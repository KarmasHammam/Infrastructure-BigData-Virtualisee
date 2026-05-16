#!/bin/bash
# Configuration Firewall UFW sur VM3-DATA

echo "=== Configuration UFW VM3-DATA ==="

# Politique par défaut
sudo ufw default deny incoming
sudo ufw default allow outgoing

# SSH
sudo ufw allow 22/tcp

# PostgreSQL UNIQUEMENT depuis VM2
sudo ufw allow from 192.168.100.20 to any port 5432 proto tcp

# NFS réseau interne
sudo ufw allow from 192.168.100.0/24 to any port 2049 proto tcp
sudo ufw allow from 192.168.100.0/24 to any port 111 proto tcp

# Communication réseau interne
sudo ufw allow from 192.168.100.0/24

# Activation
sudo ufw --force enable

echo "=== Règles UFW ==="
sudo ufw status numbered

echo "✓ Firewall UFW configuré !"