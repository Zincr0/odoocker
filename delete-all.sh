#!/bin/bash
docker stop odoo
docker stop postgres
docker rm odoo
docker rm postgres
sudo rm -r postgres/data/*