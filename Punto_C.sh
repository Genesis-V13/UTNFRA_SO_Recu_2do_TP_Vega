#!/bin/bash
mkdir -p 202411/docker/web/file
cat << 'EOM' > 202411/docker/index.html
<ul>
<li>G Vega</li>
<li>División: 116</li>
</ul>
EOM
cat << 'EOM' > 202411/docker/web/file/info.txt
Nombre de tu usuario: gvega
ID de tu usuario: 1001
Hash pass de tu usuario: $y$j9T$pu3X1UsBKe24Q8rJWTJ031$E7h6YG4/rooYPv0U8AvTZ869PWtk214K0bDCb6Ghp8C
EOM
cat << 'EOM' > 202411/docker/Dockerfile
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
EOM
cd 202411/docker
docker build -t web2-vega .
docker tag web2-vega genesisvegaaz/web2-vega:latest
cat << 'EOM' > docker-compose.yml
version: '3'
services:
  web:
    image: genesisvegaaz/web2-vega:latest
    ports:
      - "81:80"
    volumes:
      - ./web/file:/usr/share/nginx/html/file/
EOM
docker compose up -d
cd ../..
