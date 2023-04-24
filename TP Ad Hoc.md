## Exercice

----------

Effectuer sur la seconde machine les opérations suivantes en utilisant plutôt des commandes ad hoc avec Ansible, en partant de la première machine :


- Vérifier la connectivité avec une machine distante

``` bash
ansible webservers -i hosts -m ping
```

- Vérifier l'espace disque disponible

``` bash
ansible webservers -i hosts -a "df -h --output=source,size,used,avail" -b -K
```

- Redémarrer la machine

``` bash
ansible server1 -i hosts -a "/sbin/reboot" -b -K
ansible webservers -i hosts -m reboot -b -K
```

- Vérifier l'état du service apache2

``` bash
ansible webservers -i hosts -a "systemctl status apache2"
ansible webservers -i hosts -m service -a "name=apache2"
```

- Vérifier les informations réseau

``` bash
ansible webservers -i hosts -a "ip a"
ansible webservers -i hosts -m shell -a "ip addr show | grep 'inet ' | awk '{print \$2}' | cut -d/ -f1"
```

- Vérifier les fichiers modifiés récemment (- 24 heures)

``` bash
ansible server1 -i hosts -m find -a "paths=/ age=-1d"
```
recurse=true (pour recherche recursive)

**Age parameter**: Select files whose age is equal to or greater than the specified time. Use a negative age to find files equal to or less than the specified time.
[1](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/find_module.html#parameter-age)

- Vérifier les informations sur les utilisateurs

``` bash
ansible server1 -i hosts -m ansible.builtin.getent -a "database=passwd"
```

- Vérifier les informations sur les processus consommant le plus de ressources :

*Using Cpu*: 

```bash
ansible server1 -i hosts -m shell -a "ps aux --sort=-%cpu | head -n 6"
ansible server1 -i hosts -m shell -a "top -b -n 1 -o %MEM
```

*Using mem*:

```bash
ansible server1 -i hosts -m shell -a "ps aux --sort=-%mem | head -n 6"
```

- Copier un fichier sur une machine distante

``` bash
ansible server1 -i hosts -m copy -a "src=/home/vmware/Documents/install_vm dest=/home/vm2/Desktop mode=766"
```

- Installer le paquet Nginx sur l’autre machine

``` bash
ansible server1 -i hosts -m apt -a "name=nginx state=present" -b -K
```

- Redémarrer le service Apache2 sur la machine distante

``` bash
ansible server1 -i hosts -m service -a "name=apache2 state=reloaded" -b -K
```

- Supprimer un package et purge fichiers de config

``` bash
ansible server1 -i hosts -m apt -a "name=apache2 state=absent purge=true" -b -K
```