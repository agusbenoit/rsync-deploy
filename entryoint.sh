#!/bin/bash
set -e

SSH_PRIVATE_KEY=$1
SSH_HOST=$2
SSH_USER=$3
REMOTE_PATH=$4
SOURCE_PATH=${5:-"./"}
SSH_PORT=${6:-22}

echo "🔐 Setting up SSH..."
mkdir -p ~/.ssh
echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan -H "$SSH_HOST" >> ~/.ssh/known_hosts

echo "🚀 Running rsync from '$SOURCE_PATH' to '$SSH_USER@$SSH_HOST:$REMOTE_PATH' through port $SSH_PORT..."
rsync -avz --delete -e "ssh -o StrictHostKeyChecking=no -p $SSH_PORT" "$SOURCE_PATH" "$SSH_USER@$SSH_HOST:$REMOTE_PATH"
