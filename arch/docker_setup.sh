#!/bin/sh

echo "Installing docker..."
sudo pacman -S --needed docker

echo "Starting docker service..."
sudo systemctl start docker.service
sudo systemctl enable docker.service

echo "Adding docker to group..."
sudo groupadd docker

read -p "Enter user: " user
sudo usermod -aG docker $user
