## Ad-hoc commands examples:
```
ansible server1 -i hosts -m file -a "path=/home/vm2/Documents/toto.txt state=touch mode=644"

ansible server1 -i hosts -m file -a "path=/home/vm2/Documents/toto.txt state=absent"
```
* Command that need root privilege  
```
ansible server1 -i hosts -m apt -a "name=nginx state=present" -b --ask-become-pass
```