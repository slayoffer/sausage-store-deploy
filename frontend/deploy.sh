#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
sudo cp -rf sausage-store-frontend.service /etc/systemd/system/sausage-store-frontend.service ; sudo rm sausage-store.tar.gz ; sudo curl -u $NEXUS_REPO_USER:$NEXUS_REPO_PASS -o sausage-store.tar.gz $NEXUS_FRONT_REPO_URL/$CURRENT_VERSION/sausage-store-$CURRENT_VERSION.tar.gz ; sudo tar -xvf sausage-store.tar.gz ; sudo rm -r /var/www-data/dist/frontend/ ; sudo mv frontend /var/www-data/dist/ ; sudo systemctl daemon-reload ; sudo systemctl restart sausage-store-frontend