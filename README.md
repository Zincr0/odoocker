## Requisitos previos:

 1.- Instalar docker

```
curl -sSL https://get.docker.com/ | sh
```

2.- Instalar docker-compose:
```
sudo apt-get install git tree python-setuptools
sudo easy_install pip
sudo pip install docker-compose
```

3.- Permisos de ejecución:
```
chmod +x install.sh
chmod +x start.sh
chmod +x ssh-odoo.sh
chmod +x root-ssh-odoo.sh
chmod +x delete-all.sh
```

4.- instalar odoo
```
./install.sh
```

5.- levantar odoo
```
./start.sh
```

6.- ingresar al contenedor
```
./ssh-odoo.sh
```

- o como root:
```
./root-ssh-odoo.sh
```

7.- ejecutar odoo
```
passenger start
```

Y entrar por el puerto 3000 en el host.

8.- Borrar todo
```
./delete-all.sh
```
