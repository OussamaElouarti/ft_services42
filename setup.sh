 #!/bin/bash
minikube delete
minikube start
eval $(minikube -p minikube docker-env)

docker build srcs/nginx -t nginx 

docker build srcs/phpmyadmin -t phpmyadmin 

docker build srcs/Wordpress -t wordpress 

docker build  srcs/grafana -t grafana 

docker build  srcs/ftps -t ftps 

docker build srcs/influxDB -t influxdb

docker build srcs/Mysql -t mysql

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/yamlfiles 

eval $(minikube -p minikube docker-env)
sleep 3
minikube dashboard