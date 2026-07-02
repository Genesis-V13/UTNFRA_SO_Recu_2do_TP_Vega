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
