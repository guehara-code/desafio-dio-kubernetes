#!/bin/bash

echo "Criando as imagens..."

docker build -t guehara99/projeto-backend:1.0 backend/.
docker build -t guehara99/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push guehara99/projeto-backend:1.0
docker push guehara99/projeto-database:1.0

echo "Criando servicos no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml