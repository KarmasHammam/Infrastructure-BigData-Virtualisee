\# 🚀 Infrastructure Big Data Virtualisée



Projet académique de déploiement d'une infrastructure Big Data complète avec 3 machines virtuelles Ubuntu Server, cluster Apache Spark distribué, PostgreSQL SSL/TLS, stockage NFS partagé et monitoring temps réel.



\## 👥 Équipe



\- \*\*BAZZA Mohamed Amine\*\*

\- \*\*BOUHMOUCH Rihab\*\*

\- \*\*KARMAS Hammam\*\*



\*\*Encadré par :\*\* Pr. Mohamed BEN AHMED  

\*\*Année Académique :\*\* 2025-2026



\---



\## 📊 Architecture Globale



┌──────────────┐      ┌──────────────┐      ┌──────────────┐

│  VM1-MGT     │◄────►│  VM2-APP     │◄────►│  VM3-DATA    │

│ 192.168.100.10│     │ 192.168.100.20│     │ 192.168.100.30│

│              │      │              │      │              │

│ • Bastion    │      │ • Spark      │      │ • PostgreSQL │

│ • Gestion    │      │ • Jupyter    │      │ • NFS Server │

│              │      │ • Monitoring │      │              │

│ 1.5Go, 1vCPU │      │ 4Go, 2vCPU   │      │ 3Go, 2vCPU   │

└──────────────┘      └──────────────┘      └──────────────┘

&#x20;      │                     │                      │

&#x20;      └─────────────────────┴──────────────────────┘

&#x20;             Réseau Interne 192.168.100.0/24



\---



\## 🛠️ Technologies Utilisées



!\[VirtualBox](https://img.shields.io/badge/VirtualBox-7.x-blue?logo=virtualbox)

!\[Ubuntu](https://img.shields.io/badge/Ubuntu-22.04-orange?logo=ubuntu)

!\[Docker](https://img.shields.io/badge/Docker-29.4.1-blue?logo=docker)

!\[Spark](https://img.shields.io/badge/Apache%20Spark-3.5.0-E25A1C?logo=apachespark)

!\[PostgreSQL](https://img.shields.io/badge/PostgreSQL-14-336791?logo=postgresql)

!\[Prometheus](https://img.shields.io/badge/Prometheus-2.47.0-E6522C?logo=prometheus)

!\[Grafana](https://img.shields.io/badge/Grafana-10.1.5-F46800?logo=grafana)



\---



\## 🏗️ Composants Déployés



\### VM1-MGT (192.168.100.10)

\- \*\*Rôle :\*\* Bastion SSH, Machine de Gestion

\- \*\*Ressources :\*\* 1.5 Go RAM, 1 vCPU, 15 Go disque

\- \*\*Services :\*\* UFW Firewall, Client NFS



\### VM2-APP (192.168.100.20)

\- \*\*Rôle :\*\* Applications Big Data, Monitoring

\- \*\*Ressources :\*\* 4 Go RAM, 2 vCPU, 25 Go disque

\- \*\*Services :\*\*

&#x20; - Cluster Apache Spark (1 Master + 2 Workers)

&#x20; - Jupyter PySpark Notebook

&#x20; - Prometheus + Grafana + cAdvisor + Node Exporter

&#x20; - Docker 29.4.1 (8 containers)



\### VM3-DATA (192.168.100.30)

\- \*\*Rôle :\*\* Base de Données, Stockage Distribué

\- \*\*Ressources :\*\* 3 Go RAM, 2 vCPU, 30 Go + 20 Go NFS

\- \*\*Services :\*\*

&#x20; - PostgreSQL 14 avec SSL/TLS (TLSv1.3, AES-256-GCM)

&#x20; - NFS Server (disque dédié 20 Go)



\---



\## 📂 Structure du Dépôt



Infrastructure-BigData-Virtualisee/

├── README.md

├── docs/

│   └── rapport\_final.pdf

├── configs/

│   ├── vm1-mgt/

│   │   ├── netplan-vm1.yaml

│   │   ├── ufw-status-vm1.txt

│   │   └── fstab-nfs-vm1.txt

│   ├── vm2-app/

│   │   ├── docker-compose.yml

│   │   ├── docker-compose-monitoring.yml

│   │   ├── prometheus/

│   │   │   └── prometheus.yml

│   │   ├── netplan-vm2.yaml

│   │   ├── ufw-status-vm2.txt

│   │   ├── docker-containers-vm2.txt

│   │   └── fstab-nfs-vm2.txt

│   └── vm3-data/

│       ├── exports

│       ├── postgresql.conf

│       ├── pg\_hba.conf

│       ├── netplan-vm3.yaml

│       ├── ufw-status-vm3.txt

│       ├── disks-layout-vm3.txt

│       ├── disk-usage-vm3.txt

│       ├── nfs-exports-list.txt

│       └── fstab-nfs-mount-vm3.txt

├── scripts/

│   ├── setup-nfs-client.sh

│   └── setup-ufw-vm3.sh

└── screenshots/

&#x20;   ├── 01-infrastructure/

&#x20;   │   ├── 01-port-forwarding-vm1.png

&#x20;   │   ├── 02-ssh-connexion-vm1.png

&#x20;   │   └── 03-ip-statique-vm1.png

&#x20;   ├── 02-reseau/

&#x20;   │   ├── 04-port-forwarding-vm2.png

&#x20;   │   ├── 05-ping-vm2-to-vm1.png

&#x20;   │   └── 07-vm3-ping-all.png

&#x20;   ├── 03-bigdata/

&#x20;   │   ├── 06-docker-hello-world.png

&#x20;   │   ├── 11-spark-master-ui.png

&#x20;   │   ├── 12-jupyter-interface.png

&#x20;   │   ├── 13-spark-job-results.png

&#x20;   │   └── 14-spark-completed-app.png

&#x20;   ├── 04-stockage/

&#x20;   │   ├── 08-postgresql-remote.png

&#x20;   │   └── 09-nfs-shared-files.png

&#x20;   ├── 05-securite/

&#x20;   │   ├── 16-ufw-vm3-rules.png

&#x20;   │   ├── 17-vm1-postgresql-blocked.png

&#x20;   │   └── 18-vm2-postgresql-allowed.png

&#x20;   ├── 06-monitoring/

&#x20;   │   ├── 19-prometheus-targets.png

&#x20;   │   ├── 21-cadvisor-interface.png

&#x20;   │   └── 22-grafana-node-exporter-full.png

&#x20;   └── 07-validation/

&#x20;       └── 10-test-complet.png



\---



\## 📈 Résultats Obtenus



✅ \*\*Cluster Spark\*\* : Job d'analyse Big Data exécuté avec succès (32 minutes)  

✅ \*\*PostgreSQL SSL\*\* : Chiffrement TLSv1.3 avec cipher AES-256-GCM-SHA384  

✅ \*\*Monitoring\*\* : 3 targets Prometheus UP, dashboards Grafana temps réel  

✅ \*\*Sécurité\*\* : Firewall UFW actif sur 3 VM, tests de blocage validés  

✅ \*\*Disponibilité Réseau\*\* : 0% packet loss, latence < 2ms  

✅ \*\*Stockage NFS\*\* : Partage de fichiers opérationnel entre les 3 VM



\---



\## 🚀 Guide de Déploiement



\### Prérequis

\- VirtualBox 7.x installé

\- Ubuntu Server 22.04 ISO

\- Minimum 8.5 Go RAM disponible

\- 85 Go espace disque



\### Installation Étape par Étape



\#### 1. Créer les 3 VM sur VirtualBox



VM1-MGT  : 1.5 Go RAM, 1 vCPU, 15 Go disque

VM2-APP  : 4 Go RAM, 2 vCPU, 25 Go disque

VM3-DATA : 3 Go RAM, 2 vCPU, 30 Go disque principal + 20 Go disque NFS



\#### 2. Configurer le Réseau

\- \*\*Adapter 1 (NAT)\*\* : Accès Internet + Port Forwarding SSH

\- \*\*Adapter 2 (Réseau Interne "intnet-secure")\*\* : Communication inter-VM



Port Forwarding :



VM1 : localhost:2221 → 22 (SSH)

VM2 : localhost:2222 → 22 (SSH), localhost:8080 → 8080 (Spark), localhost:8888 → 8888 (Jupyter)

VM3 : localhost:2223 → 22 (SSH)



\#### 3. Configurer NFS sur VM3



```bash

sudo apt install nfs-kernel-server

sudo cp configs/vm3-data/exports /etc/exports

sudo systemctl restart nfs-server

```



\#### 4. Déployer Spark sur VM2



```bash

cd configs/vm2-app/

docker compose up -d

docker compose -f docker-compose-monitoring.yml up -d

```



\#### 5. Configurer PostgreSQL SSL sur VM3



```bash

sudo cp configs/vm3-data/postgresql.conf /etc/postgresql/14/main/

sudo cp configs/vm3-data/pg\_hba.conf /etc/postgresql/14/main/

sudo systemctl restart postgresql

```



\---



\## 📊 Ressources Totales



| VM | RAM | CPU | Disque | Rôle |

|----|-----|-----|--------|------|

| VM1-MGT | 1.5 Go | 1 vCPU | 15 Go | Bastion |

| VM2-APP | 4 Go | 2 vCPU | 25 Go | Big Data |

| VM3-DATA | 3 Go | 2 vCPU | 50 Go | Données |

| \*\*TOTAL\*\* | \*\*8.5 Go\*\* | \*\*5 vCPU\*\* | \*\*85 Go\*\* | - |



\---



\## 🔐 Sécurité Implémentée



\- ✅ Firewall UFW actif sur les 3 VM

\- ✅ PostgreSQL accessible UNIQUEMENT depuis VM2 (192.168.100.20)

\- ✅ Chiffrement SSL/TLS (TLSv1.3, cipher AES-256-GCM-SHA384)

\- ✅ NFS limité au réseau interne (192.168.100.0/24)

\- ✅ Isolation réseau stricte (Réseau Interne VirtualBox)

\- ✅ Tests de blocage validés (VM1 ne peut PAS accéder à PostgreSQL)



\---



\## 📸 Captures d'Écran



Toutes les captures d'écran du projet sont organisées dans `screenshots/` :



\- \*\*01-infrastructure/\*\* : Configuration VirtualBox, SSH, IP statiques

\- \*\*02-reseau/\*\* : Port Forwarding, tests de connectivité

\- \*\*03-bigdata/\*\* : Docker, Spark UI, Jupyter, résultats analyses

\- \*\*04-stockage/\*\* : PostgreSQL remote, NFS partagé

\- \*\*05-securite/\*\* : UFW rules, tests de blocage PostgreSQL

\- \*\*06-monitoring/\*\* : Prometheus targets, cAdvisor, Grafana

\- \*\*07-validation/\*\* : Test de validation complet VM2



\---



\## 📄 Documentation



Le rapport technique complet (29 pages) est disponible dans `docs/rapport\_final.pdf`



\*\*Contenu du rapport :\*\*

\- Architecture détaillée

\- Configuration de chaque VM

\- Cluster Big Data Apache Spark

\- PostgreSQL avec SSL/TLS

\- Stockage NFS distribué

\- Sécurisation multi-niveaux

\- Monitoring temps réel

\- Tests et validation



\---



