#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf sausage-store-backend.service /etc/systemd/system/sausage-store-backend.service ; sudo rm -f /home/jarservice/sausage-store.jar ; sudo curl -u $NEXUS_REPO_USER:$NEXUS_REPO_PASS -o sausage-store.jar $NEXUS_BACK_REPO_URL/com/yandex/practicum/devops/sausage-store/$CURRENT_VERSION/sausage-store-$CURRENT_VERSION.jar ; sudo systemctl daemon-reload ; sudo systemctl restart sausage-store-backend 