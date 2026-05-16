<div align="center">

# 🚀 Infrastructure Big Data Virtualisée

### *Déploiement d'une architecture cloud distribuée haute performance*

[![Made with VirtualBox](https://img.shields.io/badge/Made%20with-VirtualBox-183A61?style=for-the-badge&logo=virtualbox&logoColor=white)](https://www.virtualbox.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-22.04%20LTS-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)
[![Docker](https://img.shields.io/badge/Docker-29.4.1-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![Apache Spark](https://img.shields.io/badge/Apache%20Spark-3.5.0-E25A1C?style=for-the-badge&logo=apachespark&logoColor=white)](https://spark.apache.org/)

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14-336791?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Prometheus](https://img.shields.io/badge/Prometheus-2.47.0-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)](https://prometheus.io/)
[![Grafana](https://img.shields.io/badge/Grafana-10.1.5-F46800?style=for-the-badge&logo=grafana&logoColor=white)](https://grafana.com/)

<br/>

**Projet académique réalisé dans le cadre du module Infrastructure et Virtualisation**

*Année académique 2025-2026*

</div>

---

## 👥 Équipe de Développement

<table align="center">
<tr>
</td>
<td align="center">
<strong>KARMAS Hammam</strong><br/>
</td>
</tr>
</table>

<div align="center">

**Encadré par :** Pr. Mohamed BEN AHMED

</div>

---

## 📋 Table des Matières

- [🎯 Vue d'Ensemble](#-vue-densemble)
- [🏗️ Architecture](#️-architecture)
- [⚡ Composants Techniques](#-composants-techniques)
- [📊 Résultats & Performance](#-résultats--performance)
- [🚀 Guide de Déploiement](#-guide-de-déploiement)
- [🔐 Sécurité](#-sécurité)
- [📸 Captures d'Écran](#-captures-décran)
- [📂 Structure du Projet](#-structure-du-projet)
- [📄 Documentation](#-documentation)
- [🤝 Contribution](#-contribution)

---

## 🎯 Vue d'Ensemble

Ce projet démontre la conception et le déploiement d'une **infrastructure Big Data complète** basée sur des technologies cloud-native modernes. L'architecture met en œuvre les principes DevOps avec une approche **Infrastructure as Code**, garantissant reproductibilité, scalabilité et haute disponibilité.

### 🎖️ Points Forts

```
✨ Architecture 3-tiers distribuée et isolée
🔥 Cluster Apache Spark avec traitement parallèle
🛡️ Sécurisation multi-niveaux (SSL/TLS + Firewall)
📈 Monitoring temps réel avec stack Prometheus/Grafana
💾 Stockage distribué NFS haute performance
🐳 Conteneurisation complète avec Docker Compose
```

---

## 🏗️ Architecture

<div align="center">

### Topologie Réseau

```
                    ┌─────────────────────────────────────┐
                    │   Windows Host (VirtualBox 7.x)     │
                    │   Port Forwarding NAT               │
                    └──────────┬──────────────────────────┘
                               │
              ┌────────────────┼────────────────┐
              │                │                │
              ▼                ▼                ▼
    ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
    │   VM1-MGT       │  │   VM2-APP       │  │   VM3-DATA      │
    │ 192.168.100.10  │  │ 192.168.100.20  │  │ 192.168.100.30  │
    ├─────────────────┤  ├─────────────────┤  ├─────────────────┤
    │ 🛡️ Bastion SSH  │  │ 🚀 Spark Master │  │ 🗄️ PostgreSQL   │
    │ 📊 Monitoring   │  │ 📓 Jupyter      │  │ 💾 NFS Server   │
    │ 🔧 Management   │  │ 📈 Prometheus   │  │ 🔐 SSL/TLS      │
    │                 │  │ 📊 Grafana      │  │                 │
    ├─────────────────┤  ├─────────────────┤  ├─────────────────┤
    │ 1.5GB RAM       │  │ 4GB RAM         │  │ 3GB RAM         │
    │ 1 vCPU          │  │ 2 vCPU          │  │ 2 vCPU          │
    │ 15GB Disk       │  │ 25GB Disk       │  │ 30GB + 20GB NFS │
    └─────────────────┘  └─────────────────┘  └─────────────────┘
              │                │                │
              └────────────────┴────────────────┘
                  Réseau Interne Isolé
                   192.168.100.0/24
```

</div>

### 🔄 Flux de Données

1. **Ingestion** : Jupyter Notebook → Spark Master
2. **Traitement** : Spark distribue sur 2 Workers (parallélisation)
3. **Stockage** : Résultats sauvegardés sur NFS partagé
4. **Persistence** : PostgreSQL avec chiffrement SSL/TLS
5. **Monitoring** : Prometheus scrape → Grafana visualise

---

## ⚡ Composants Techniques

<details>
<summary><b>🖥️ VM1-MGT - Machine de Gestion</b></summary>

### Rôle
Bastion SSH sécurisé pour l'administration centralisée de l'infrastructure.

### Spécifications
| Ressource | Valeur |
|-----------|--------|
| RAM | 1.5 GB |
| vCPU | 1 |
| Stockage | 15 GB |
| IP Interne | 192.168.100.10/24 |
| Port SSH | 2221 (NAT) |

### Services
- ✅ UFW Firewall actif
- ✅ Client NFS monté
- ✅ Point d'entrée SSH unique

</details>

<details>
<summary><b>🚀 VM2-APP - Plateforme Big Data</b></summary>

### Rôle
Hébergement du cluster Spark, Jupyter et stack de monitoring complète.

### Spécifications
| Ressource | Valeur |
|-----------|--------|
| RAM | 4 GB |
| vCPU | 2 |
| Stockage | 25 GB |
| IP Interne | 192.168.100.20/24 |
| Ports Exposés | 2222, 8080, 8888, 9090, 3000, 8081 |

### Stack Déployée

#### 🔥 Cluster Apache Spark
```yaml
Architecture: 1 Master + 2 Workers
Version: 3.5.0
Ressources par Worker: 1 GB RAM, 1 core
Réseau: Docker bridge isolé
```

#### 📓 Jupyter Notebook
```yaml
Image: jupyter/pyspark-notebook:spark-3.5.0
Intégration: PySpark avec Spark Master
Port: 8888
```

#### 📊 Stack Monitoring
```yaml
Prometheus: v2.47.0 (scrape interval: 15s)
Grafana: v10.1.5 (admin/admin)
cAdvisor: v0.47.0 (métriques containers)
Node Exporter: v1.6.1 (métriques système)
```

### Containers Actifs (8)
```
spark-master       apache/spark:3.5.0         UP
spark-worker-1     apache/spark:3.5.0         UP
spark-worker-2     apache/spark:3.5.0         UP
jupyter-spark      pyspark-notebook:3.5.0     UP
prometheus         prom/prometheus:v2.47.0    UP
grafana            grafana/grafana:10.1.5     UP
cadvisor           cadvisor:v0.47.0           UP
node-exporter      node-exporter:v1.6.1       UP
```

</details>

<details>
<summary><b>💾 VM3-DATA - Stockage & Base de Données</b></summary>

### Rôle
Stockage distribué NFS et base de données PostgreSQL hautement sécurisée.

### Spécifications
| Ressource | Valeur |
|-----------|--------|
| RAM | 3 GB |
| vCPU | 2 |
| Stockage Système | 30 GB (sda) |
| Stockage NFS | 20 GB (sdb - dédié) |
| IP Interne | 192.168.100.30/24 |

### 🗄️ PostgreSQL 14
```yaml
Version: 14.22
SSL/TLS: Activé (TLSv1.3)
Cipher: TLS_AES_256_GCM_SHA384
Authentification: scram-sha-256
Base: bigdata_test
Utilisateur: bigdata_user
```

#### Politique de Sécurité
```conf
✅ VM2 (192.168.100.20) → Autorisée (SSL)
❌ VM1 (192.168.100.10) → Bloquée (reject)
✅ Connexions locales → Autorisées (peer)
```

### 💾 NFS Server
```yaml
Export: /mnt/nfs-shared
Réseau: 192.168.100.0/24
Options: rw, sync, no_subtree_check, no_root_squash
Permissions: 777 (accès containers Docker)
Partition: /dev/sdb1 (20GB ext4)
```

</details>

---

## 📊 Résultats & Performance

### ✅ Tests de Validation

<table>
<tr>
<td>

**🚀 Cluster Spark**
- ✅ Job Big Data exécuté : **32 minutes**
- ✅ Workers actifs : **2/2**
- ✅ Analyses distribuées validées
- ✅ Résultats sauvegardés sur NFS

</td>
<td>

**🔐 Sécurité**
- ✅ SSL/TLS TLSv1.3 opérationnel
- ✅ Firewall UFW actif (3 VM)
- ✅ Tests de blocage validés
- ✅ Isolation réseau stricte

</td>
</tr>
<tr>
<td>

**📈 Monitoring**
- ✅ Prometheus : 3 targets UP
- ✅ Grafana dashboards actifs
- ✅ Métriques temps réel : 15s
- ✅ Rétention données : 7 jours

</td>
<td>

**🌐 Réseau**
- ✅ Latence inter-VM : **< 2ms**
- ✅ Packet loss : **0%**
- ✅ NFS partagé : **20GB**
- ✅ Bande passante : **1 Gbps**

</td>
</tr>
</table>

### 📈 Métriques Système (VM2-APP)

```
CPU Usage      : 6.3%  ███░░░░░░░░░░░░░░░░░
RAM Usage      : 54.6% ███████████░░░░░░░░░
Disk Usage     : 56.9% ███████████░░░░░░░░░
Network Traffic: Stable ~~~~~~~~~~~~~~~~
Uptime         : 99.8%  ███████████████████░
```

### 🎯 Résultats Analyses Big Data

**Job Spark : Sales Analysis**

| Métrique | Résultat |
|----------|----------|
| 🥇 Top Produit | Laptop - **$18,800** |
| 📦 Quantité Totale | **159 unités** |
| 🌍 Meilleure Région | North - **$16,950** |
| ⏱️ Durée Exécution | **32 minutes** |
| 💾 Fichiers Générés | **2 CSV** (produits, régions) |

---

## 🚀 Guide de Déploiement

### 📋 Prérequis

```bash
- VirtualBox 7.x ou supérieur
- Ubuntu Server 22.04 LTS ISO
- 8.5 GB RAM minimum disponible
- 85 GB espace disque libre
- Connexion Internet (installation packages)
```

### ⚡ Installation Rapide (5 étapes)

#### 1️⃣ Créer les VM dans VirtualBox

```bash
VM1-MGT  : 1.5GB RAM | 1 vCPU | 15GB disque
VM2-APP  : 4GB RAM   | 2 vCPU | 25GB disque
VM3-DATA : 3GB RAM   | 2 vCPU | 30GB + 20GB NFS
```

#### 2️⃣ Configurer le Réseau

**Chaque VM : 2 Adapters**
- **Adapter 1** : NAT (Internet + Port Forwarding)
- **Adapter 2** : Réseau Interne `intnet-secure`

**Port Forwarding NAT**
```
VM1 : localhost:2221 → VM1:22
VM2 : localhost:2222 → VM2:22
      localhost:8080 → VM2:8080 (Spark UI)
      localhost:8888 → VM2:8888 (Jupyter)
      localhost:9090 → VM2:9090 (Prometheus)
      localhost:3000 → VM2:3000 (Grafana)
VM3 : localhost:2223 → VM3:22
```

#### 3️⃣ Déployer NFS (VM3)

```bash
sudo apt update && sudo apt install -y nfs-kernel-server
sudo cp configs/vm3-data/exports /etc/exports
sudo exportfs -arv
sudo systemctl enable --now nfs-server
```

#### 4️⃣ Déployer Spark & Monitoring (VM2)

```bash
# Installer Docker
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER

# Déployer Spark
cd configs/vm2-app/
docker compose up -d

# Déployer Monitoring
docker compose -f docker-compose-monitoring.yml up -d
```

#### 5️⃣ Configurer PostgreSQL SSL (VM3)

```bash
sudo cp configs/vm3-data/postgresql.conf /etc/postgresql/14/main/
sudo cp configs/vm3-data/pg_hba.conf /etc/postgresql/14/main/
sudo systemctl restart postgresql
```

### ✅ Vérification

```bash
# Spark Master UI
http://localhost:8080

# Jupyter Notebook
http://localhost:8888

# Prometheus
http://localhost:9090

# Grafana
http://localhost:3000  (admin/admin)
```

---

## 🔐 Sécurité

### 🛡️ Défense en Profondeur

<div align="center">

```
┌─────────────────────────────────────────────────────┐
│  Couche 1 : Isolation Réseau (VirtualBox Internal)  │
├─────────────────────────────────────────────────────┤
│  Couche 2 : Firewall UFW (3 niveaux)               │
├─────────────────────────────────────────────────────┤
│  Couche 3 : Contrôle Accès PostgreSQL (pg_hba)     │
├─────────────────────────────────────────────────────┤
│  Couche 4 : Chiffrement SSL/TLS (TLSv1.3)          │
└─────────────────────────────────────────────────────┘
```

</div>

### 🔒 Règles UFW Implémentées

**VM3-DATA (Sécurité Maximale)**
```bash
✅ SSH             : 22/tcp    → Anywhere
✅ PostgreSQL      : 5432/tcp  → 192.168.100.20 UNIQUEMENT
✅ NFS             : 2049/tcp  → 192.168.100.0/24
✅ Portmapper      : 111/tcp   → 192.168.100.0/24
❌ Tout le reste   : DENY
```

### 🔐 PostgreSQL SSL/TLS

```yaml
Protocole        : TLSv1.3
Cipher Suite     : TLS_AES_256_GCM_SHA384
Bits             : 256
Compression      : off
Certificat       : Auto-signé (365 jours)
Authentification : scram-sha-256
```

### ✅ Tests de Sécurité Validés

| Test | Source | Destination | Résultat |
|------|--------|-------------|----------|
| 1️⃣ Connexion PostgreSQL SSL | VM2 | VM3:5432 | ✅ **AUTORISÉ** |
| 2️⃣ Connexion PostgreSQL | VM1 | VM3:5432 | ❌ **BLOQUÉ** |
| 3️⃣ Montage NFS | VM1 | VM3:2049 | ✅ **AUTORISÉ** |
| 4️⃣ Montage NFS | VM2 | VM3:2049 | ✅ **AUTORISÉ** |
| 5️⃣ Ping Inter-VM | Toutes | Toutes | ✅ **0% loss** |

---

## 📸 Captures d'Écran

Les captures d'écran sont organisées par catégorie dans `screenshots/` :

<table>
<tr>
<td align="center">

### 🖥️ Infrastructure
3 captures

</td>
<td align="center">

### 🌐 Réseau
3 captures

</td>
<td align="center">

### 🚀 Big Data
5 captures

</td>
</tr>
<tr>
<td align="center">

### 💾 Stockage
2 captures

</td>
<td align="center">

### 🔐 Sécurité
3 captures

</td>
<td align="center">

### 📊 Monitoring
3 captures

</td>
</tr>
<tr>
<td align="center" colspan="3">

### ✅ Validation
1 capture

</td>
</tr>
</table>

---

## 📂 Structure du Projet

```
Infrastructure-BigData-Virtualisee/
│
├── 📄 README.md                    # Ce fichier
├── 📄 .gitignore                   # Fichiers exclus Git
│
├── 📁 docs/
│   └── 📘 rapport_final.pdf        # Rapport technique (29 pages)
│
├── 📁 configs/
│   ├── 📁 vm1-mgt/                 # Configs VM1
│   │   ├── netplan-vm1.yaml
│   │   ├── ufw-status-vm1.txt
│   │   └── fstab-nfs-vm1.txt
│   │
│   ├── 📁 vm2-app/                 # Configs VM2
│   │   ├── docker-compose.yml
│   │   ├── docker-compose-monitoring.yml
│   │   ├── 📁 prometheus/
│   │   │   └── prometheus.yml
│   │   ├── netplan-vm2.yaml
│   │   └── ufw-status-vm2.txt
│   │
│   └── 📁 vm3-data/                # Configs VM3
│       ├── exports
│       ├── postgresql.conf
│       ├── pg_hba.conf
│       ├── netplan-vm3.yaml
│       └── ufw-status-vm3.txt
│
├── 📁 scripts/
│   ├── 🔧 setup-nfs-client.sh      # Installation NFS client
│   └── 🔧 setup-ufw-vm3.sh         # Configuration firewall VM3
│
└── 📁 screenshots/                 # 20 captures organisées
    ├── 01-infrastructure/
    ├── 02-reseau/
    ├── 03-bigdata/
    ├── 04-stockage/
    ├── 05-securite/
    ├── 06-monitoring/
    └── 07-validation/
```

---

## 📄 Documentation

### 📘 Rapport Technique Complet

Un rapport de **29 pages** détaille l'ensemble du projet :

- 🏗️ Architecture détaillée et justifications techniques
- 🔧 Configuration complète de chaque VM
- 🚀 Déploiement du cluster Apache Spark
- 🗄️ PostgreSQL avec SSL/TLS
- 💾 Stockage distribué NFS
- 🔐 Sécurisation multi-niveaux
- 📊 Monitoring temps réel
- ✅ Tests et validation
- 🐛 Difficultés rencontrées et solutions

**📥 Disponible dans :** `docs/rapport_final.pdf`

---

## 🤝 Contribution

### 🌟 Comment Contribuer

Ce projet est réalisé dans un cadre académique, mais les contributions sont les bienvenues !

1. 🍴 Forkez le projet
2. 🌿 Créez une branche (`git checkout -b feature/amelioration`)
3. ✏️ Committez vos changements (`git commit -m 'Ajout fonctionnalité'`)
4. 📤 Pushez (`git push origin feature/amelioration`)
5. 🔃 Ouvrez une Pull Request


</div>
