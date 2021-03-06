# WSGI Handler sample configuration file.
#
# Change the appropriate settings below, in order to provide the parameters
# that would normally be passed in the command-line.
# (at least conf['addons_path'])
#
# For generic wsgi handlers a global application is defined.
# For uwsgi this should work:
#   $ uwsgi_python --http :9090 --pythonpath . --wsgi-file openerp-wsgi.py
#
# For gunicorn additional globals need to be defined in the Gunicorn section.
# Then the following command should run:
#   $ gunicorn openerp:service.wsgi_server.application -c openerp-wsgi.py

import openerp

#----------------------------------------------------------
# Common
#----------------------------------------------------------
# openerp.multi_process = True # Nah!
openerp.multi_process = False # Nah!

# Equivalent of --load command-line option
openerp.conf.server_wide_modules = ['web']
conf = openerp.tools.config

# Path to the OpenERP Addons repository (comma-separated for
# multiple locations)

conf['addons_path'] = '/usr/local/lib/python2.7/dist-packages,/home/app/code/addons,/home/app/reporting-engine,/home/app/custom-addons'

# Optional database config if not using local socket
conf['db_name'] = 'odoo'
conf['db_host'] = 'postgres'
conf['db_user'] = 'odoo'
conf['db_port'] = 5432
conf['db_password'] = 'odoo'

#----------------------------------------------------------
# Generic WSGI handlers application
#----------------------------------------------------------
application = openerp.service.wsgi_server.application

openerp.service.server.load_server_wide_modules()

#----------------------------------------------------------
# Gunicorn
#----------------------------------------------------------
# Standard OpenERP XML-RPC port is 8069
# bind = '127.0.0.1:8069'
# pidfile = '.gunicorn.pid'
# workers = 4
# timeout = 240
# max_requests = 2000