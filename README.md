# Mautic Setup & Deployment Guide

## Overview
This repository contains everything you need to run Mautic with Docker and Docker Compose for local development and production deployment.

## Prerequisites
- Docker Desktop installed ([Download](https://www.docker.com/products/docker-desktop))
- Docker Compose (included with Docker Desktop)
- 2GB+ RAM available
- Git (optional but recommended)

## Quick Start with Docker

### 1. Clone or Download this Repository
```bash
git clone https://github.com/SandeepBro/blank.git
cd blank
```

### 2. Start Mautic with Docker Compose
```bash
docker-compose up -d
```

This command will:
- Start a Mautic container on port 8080
- Start a MySQL database container on port 3306
- Create persistent volumes for data storage

### 3. Access Mautic
Open your browser and navigate to:
```
http://localhost:8080
```

Follow the installation wizard to complete the setup.

### 4. Database Credentials (Default)
- **Database Host**: db
- **Database Name**: mautic
- **Database User**: mautic
- **Database Password**: mautic_pass

## Docker Compose Services

The `docker-compose.yml` file defines two services:

### Mautic Service
- **Image**: mautic/mautic
- **Port**: 8080 (mapped to container port 80)
- **Volume**: mautic_data (/var/www/html)
- **Environment Variables**: Database connection settings

### MySQL Service
- **Image**: mysql:5.7
- **Port**: 3306 (mapped to container port 3306)
- **Volume**: db_data (/var/lib/mysql)
- **Environment Variables**: Database root password and user credentials

## Configuration Files

### docker-compose.yml
Contains the Docker service definitions for Mautic and MySQL. Modify this file to adjust:
- Port mappings
- Volume locations
- Environment variables
- Service dependencies

### .env
Environment variables for Mautic configuration. Update this file with:
- Database credentials
- Mautic environment (dev/prod)
- Base URL for your Mautic instance

## Common Commands

### Start Services
```bash
docker-compose up -d
```

### Stop Services
```bash
docker-compose down
```

### View Logs
```bash
docker-compose logs -f mautic
docker-compose logs -f db
```

### Access Mautic Container
```bash
docker-compose exec mautic bash
```

### Access Database
```bash
docker-compose exec db mysql -u mautic -p mautic
```

## Installation Steps (After Starting Containers)

1. **Access the Installation Wizard**: Open http://localhost:8080 in your browser
2. **Database Configuration**: Use the default credentials provided above
3. **Complete Setup**: Follow the on-screen wizard to finish installation
4. **Login**: Use the admin credentials you created during setup

## Persistent Data

All Mautic files and database data are stored in Docker volumes:
- `mautic_data`: Contains Mautic application files
- `db_data`: Contains MySQL database files

These volumes persist even when containers are stopped or removed.

## Troubleshooting

### Port Already in Use
If port 8080 is already in use, modify the `docker-compose.yml` file:
```yaml
ports:
  - "8081:80"  # Change 8080 to any available port
```

### Database Connection Error
Ensure the MySQL container is running:
```bash
docker-compose logs db
```

### Permission Issues
If you encounter permission errors, rebuild the containers:
```bash
docker-compose down -v
docker-compose up -d
```

### Reset Everything
To completely reset Mautic and start fresh:
```bash
docker-compose down -v
docker-compose up -d
```

## Production Deployment

For production environments, consider:
- Using environment-specific `.env` files
- Configuring HTTPS/SSL certificates
- Setting up backup strategies for database volumes
- Configuring mail/SMTP settings in Mautic UI
- Setting up cron jobs for Mautic maintenance tasks

## Additional Resources
- [Official Mautic Documentation](https://docs.mautic.org)
- [Mautic Community Forum](https://forum.mautic.org)
- [Docker Documentation](https://docs.docker.com)
- [Docker Compose Documentation](https://docs.docker.com/compose)

## Support
For issues or questions, refer to the Mautic official documentation or community forum.