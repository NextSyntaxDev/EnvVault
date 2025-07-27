#!/bin/bash
cd target || { echo "Erro: Pasta 'target' não encontrada."; exit 1; }
java -Xms256m -Xmx768m -jar backend-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod > /dev/null 2>&1 &
