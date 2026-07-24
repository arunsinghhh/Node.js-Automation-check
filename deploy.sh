#!/bin/bash

set -e

cd /var/www/html/Node.js-Automation-check

OLD_COMMIT=$(git rev-parse HEAD)

npm install
npm run build

pm2 restart node-demo || pm2 start app.js --name node-demo

curl -f http://localhost:3000 || {
    echo "Health Check Failed. Rolling back..."

    git reset --hard "$OLD_COMMIT"

    npm install
    npm run build

    pm2 restart node-demo

    exit 1
}
