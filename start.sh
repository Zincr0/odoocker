#!/bin/bash
docker stop odoo
docker stop postgres
docker rm odoo
# docker rm postgres
sudo rm odoo/code/*.log
sudo rm odoo/code/*.lock
sudo rm odoo/code/passenger_wsgi.p*
sudo cp odoo/conf/passenger_wsgi.py odoo/code/passenger_wsgi.py
sudo chmod -R 777 odoo
docker-compose up -d
