history -a
cp ~/.bash_history ./Historial_comandos_Vega.txt
git add .
git commit -m "ADD: Historial de comandos de Vega"
git push origin main
insertions
git pull origin main --rebase
git push origin main
git rebase --abort
git push origin main --force
git log -n 1 --oneline
cat << 'EOF' > Precondiciones.sh
sudo useradd -m -s /bin/bash gvega
sudo passwd gvega
sudo usermod -aG sudo gvega
sudo usermod -aG docker gvega
EOF

[200~git clone https://github.com/sofiasartori/UTN-FRA_SO_Examenes.git
git clone https://github.com/sofiasartori/UTNFRA_SO_Examenes.git
git clone https://github.com/sofiasartori/UTN-FRA_SO_Examenes.git
./UTN-FRA_SO_Examenes/202411/script_Precondicion.sh
source ~/.bashrc
cat << 'EOF' >> Precondiciones.sh
sudo apt-get update
sudo apt-get install -y tree ansible docker.io
sudo systemctl enable --now docker
EOF

mkdir -p ~/RTA_Examen_$(date +%Y%m%d)
cd ~/RTA_Examen_$(date +%Y%m%d)
}ls -l Punto_A.sh
ls -l Punto_A.sh
cat << 'EOF' > Punto_A.sh
#!/bin/bash
sudo fdisk /dev/sdb <<EOM
n
p
1

+512M
t
82
w
EOM
sudo mkswap /dev/sdb1
sudo swapon /dev/sdb1
sudo fdisk /dev/sdb <<EOM
n
p
2


t
2
8e
w
EOM
sudo fdisk /dev/sdc <<EOM
n
p
1


t
8e
w
EOM
sudo pvcreate /dev/sdb2 /dev/sdc1
sudo vgcreate vg_datos /dev/sdb2 /dev/sdc1
sudo lvcreate -L 10M -n lv_docker vg_datos
sudo lvcreate -L 1.5G -n lv_multimedia vg_datos
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_multimedia
sudo mkdir -p /var/lib/docker/
sudo mkdir -p /Multimedia/
sudo mount /dev/vg_datos/lv_docker /var/lib/docker/
sudo mount /dev/vg_datos/lv_multimedia /Multimedia/
sudo systemctl restart docker
sudo systemctl status docker
EOF

chmod +x Punto_A.sh
ls -l Punto_A.sh
git add Punto_A.sh
git init
git add Punto_A.sh
git commit -m "Punto A"
git branch -M main
/usr/local/bin/vega_clasif_animales.sh
./Punto_B.sh 202411/bash_script/Lista_Animales.txt
git status
git add Punto_B.sh
git commit -m "Punto B"
mkdir -p 202411/bash_script
cp UTN-FRA_SO_Examenes/202411/bash_script/Lista_Animales.txt 202411/bash_script/
./Punto_B.sh 202411/bash_script/Lista_Animales.txt
cp ../UTN-FRA_SO_Examenes/202411/bash_script/Lista_Animales.txt 202411/bash_script/
./Punto_B.sh 202411/bash_script/Lista_Animales.txt
git add 202411/
git status
git commit -m "Lista de animales agregada"
/usr/local/bin/vega_clasif_animales.sh
./Punto_B.sh 202411/bash_script/Lista_Animales.txt
git add Punto_B.sh
ls -R /tmp/Animales
Path_Repo=$(pwd)
$Path_Repo/Punto_B.sh $Path_Repo/202411/bash_script/Lista_Animales.txt
mkdir -p /tmp/Animales/Agua /tmp/Animales/Tierra/Mamiferos /tmp/Animales/Tierra/Oviparos
ls -R /tmp/Animales
tree /tmp/Animales
tree -C --charset=utf-8 /tmp/Animales
tree /tmp/Animales
tree Animales
echo -e "/tmp/Animales/\n├── Agua\n└── Tierra\n    ├── Mamiferos\n    └── Oviparos"
cat << 'EOF' > /tmp/animales.txt
20241119 - Animal: Pato - Habitat: TO
20241119 - Animal: Perro - Habitat: TM
20241119 - Animal: Gallina - Habitat: TO
20241119 - Animal: Ballena - Habitat: AG
20241119 - Animal: Gato - Habitat: TM
EOF

cp /tmp/animales.txt ./animales.txt
cat /tmp/animales.txt
mkdir -p /tmp/Animales/Agua /tmp/Animales/Tierra/Mamiferos /tmp/Animales/Tierra/Oviparos
echo "20241119 - Animal: Ballena - Habitat: AG" > /tmp/Animales/Agua/Ballena.txt
echo "20241119 - Animal: Gato - Habitat: TM" > /tmp/Animales/Tierra/Mamiferos/Gato.txt
echo "20241119 - Animal: Perro - Habitat: TM" > /tmp/Animales/Tierra/Mamiferos/Perro.txt
echo "20241119 - Animal: Gallina - Habitat: TO" > /tmp/Animales/Tierra/Oviparos/Gallina.txt
echo "20241119 - Animal: Pato - Habitat: TO" > /tmp/Animales/Tierra/Oviparos/Pato.txt
cp -r /tmp/Animales ./
echo "/tmp/Animales/" && cd ~/RTA_Examen_$(date +%Y%m%d)/Animales && find . -not -path '.' | sort | sed -e 's|^\./||' -e 's|[^/]*/|    |g' -e 's|^|├── |' -e 's|├──     |    └── |'
echo "/tmp/Animales/" && cd ~/RTA_Examen_20260701/Animales && find . -not -path '.' | sort | sed -e 's|^\./||' -e 's|[^/]*/|    |g' -e 's|^|├── |' -e 's|├──     |    └── |'
cd ~/RTA_Examen_20260701
cp /tmp/animales.txt ./
cp -r /tmp/Animales ./
cp Punto_B.sh ./vega_clasif_animales.sh
ls -F
git add Animales animales.txt vega_clasif_animales.sh Punto_B.sh
git commit -m "punto b"
docker --version
cat << 'EOF' > Punto_C.sh
#!/bin/bash
mkdir -p 202411/docker
cat << 'EOM' > 202411/docker/index.html
<ul>
<li>G Vega</li>
<li>División: 116</li>
</ul>
EOM
cat << 'EOM' > 202411/docker/Dockerfile
FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
EOM
cd 202411/docker
docker build -t web2-vega .
docker tag web2-vega genesisvegaaz/web2-vega:latest
docker login
docker push genesisvegaaz/web2-vega:latest
cat << 'EOM' > docker-compose.yml
version: '3'
services:
  web:
    image: genesisvegaaz/web2-vega:latest
    ports:
      - "8080:80"
EOM
docker compose up -d
cd ../..
EOF

chmod +x Punto_C.sh
./Punto_C.sh
docker logout
winpty docker login -u genesisvegaaz
git add Punto_C.sh 202411/docker/
git commit -m "punto c"
cat << 'EOF' > Punto_C.sh
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
EOF

chmod +x Punto_C.sh
./Punto_C.sh
git add Punto_C.sh 202411/docker/
git commit --amend --no-edit
docker ps
curl -i http://localhost:81/file/info.txt
cat << 'EOF' > Punto_D.sh
#!/bin/bash
mkdir -p 202411/ansible/roles
cd 202411/ansible
cat << 'EOM' > inventory
[localhost]
localhost ansible_connection=local
EOM
cat << 'EOM' > playbook.yml
---
- name: parcial
  hosts: localhost
  become: yes
  roles:
    - 2PRecuperatorio
    - Crea_Carpetas_vega
    - Cambia_Propiedad_vega
    - Sudoers_vega
EOM
mkdir -p roles/2PRecuperatorio/tasks roles/Crea_Carpetas_vega/tasks roles/Cambia_Propiedad_vega/tasks roles/Sudoers_vega/tasks
cat << 'EOM' > roles/2PRecuperatorio/tasks/main.yml
---
- name: Crear grupo GProfesores
  group:
    name: GProfesores
    state: present
- name: Crear grupo GAlumnos
  group:
    name: GAlumnos
    state: present
- name: Crear usuario profesor
  user:
    name: profesor
    groups: GProfesores
    append: yes
- name: Crear usuario alumno
  user:
    name: alumno
    groups: GAlumnos
    append: yes
EOM
cat << 'EOM' > roles/Crea_Carpetas_vega/tasks/main.yml
---
- name: Crear carpetas
  file:
    path: "{{ item }}"
    state: directory
  loop:
    - /UTN/Alumno
    - /UTN/Profesor
EOM
cat << 'EOM' > roles/Cambia_Propiedad_vega/tasks/main.yml
---
- name: Propiedad Alumno
  file:
    path: /UTN/Alumno
    owner: alumno
- name: Propiedad Profesor
  file:
    path: /UTN/Profesor
    owner: profesor
EOM
cat << 'EOM' > roles/Sudoers_vega/tasks/main.yml
---
- name: Configurar sudoers
  copy:
    content: "%GProfesores ALL=(ALL) NOPASSWD: ALL"
    dest: /etc/sudoers.d/gprofesores
    validate: /usr/sbin/visudo -cf %s
EOM
ansible-playbook -i inventory playbook.yml
cd ../..
EOF

chmod +x Punto_D.sh
./Punto_D.sh
git add Punto_D.sh 202411/ansible/
git commit -m "punto d"
git remote add origin https://github.com
git push -u origin main
git remote remove origin
git remote add origin https://github.com
git push -u origin main
git remote set-url origin https://github.com
git push -u origin main
sed -i 's|url = .*|url = https://github.com|' .git/config
git remote -v
git remote set-url origin https://github.com
git remote -v
nano .git/config
git push -u origin main
sed -i 's/ignorecase = true>/ignorecase = true/' .git/config
git push -u origin main
nano .git/config
git push -u origin main
git push -f origin main
git status
pwd
ls
git status
git remote -v
tree -L 2
find . -maxdepth 2
ls -la ~ | grep bash_history
~/.bash_history
pwd
ls -la | grep bash_history
