# Quick Reference Guide for Docker and Mautic Commands

## Docker Commands

### Basic Commands
- **`docker --version`**: Check Docker version.
- **`docker info`**: Display system-wide information.

### Image Commands
- **`docker pull <image>`**: Pull an image from the Docker registry.
- **`docker images`**: List all images.
- **`docker rmi <image>`**: Remove an image.

### Container Commands
- **`docker run <options> <image>`**: Create and start a container.
- **`docker ps`**: List running containers.
- **`docker stop <container>`**: Stop a running container.
- **`docker rm <container>`**: Remove a stopped container.

### Volume Commands
- **`docker volume ls`**: List all volumes.
- **`docker volume create <volume>`**: Create a new volume.
- **`docker volume rm <volume>`**: Remove a volume.

## Mautic Commands

### Basic Commands
- **`php bin/console mautic:install`**: Install Mautic.
- **`php bin/console mautic:campaigns:trigger`**: Trigger campaigns.

### Database Commands
- **`php bin/console mautic:migrations:migrate`**: Run database migrations.
- **`php bin/console mautic:contacts:sync`**: Sync contacts.

### Cache Commands
- **`php bin/console cache:clear`**: Clear the cache.
- **`php bin/console cache:warmup`**: Warm up the cache.
