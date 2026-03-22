#!/bin/bash

# Mautic Docker Startup Script for Linux/macOS
set -e
echo "=========================================="
echo "Mautic Docker Startup Script"
echo "=========================================="
echo ""

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

echo "Checking prerequisites..."
if ! command -v docker &> /dev/null; then
    print_error "Docker is not installed."
    exit 1
fi
print_status "Docker is installed"

if ! command -v docker-compose &> /dev/null; then
    print_error "Docker Compose is not installed."
    exit 1
fi
print_status "Docker Compose is installed"

if ! docker info &> /dev/null; then
    print_error "Docker daemon is not running."
    exit 1
fi
print_status "Docker daemon is running"

echo ""
echo "Starting Mautic containers..."
echo ""

if docker-compose up -d; then
    print_status "Containers started successfully"
else
    print_error "Failed to start containers"
    exit 1
fi

echo ""
echo "Waiting for services to be ready (30 seconds)..."
sleep 30

echo ""
echo "Container Status:"
docker-compose ps

echo ""
echo "=========================================="
echo "Mautic is starting up..."
echo "=========================================="
echo ""
print_status "Mautic will be available at: http://localhost:8080"
echo ""
echo "Next steps:"
echo "1. Open http://localhost:8080 in your browser"
echo "2. Follow the installation wizard"