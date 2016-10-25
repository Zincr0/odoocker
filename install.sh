#!/bin/bash
docker stop odoo
docker stop postgres
docker rm odoo
docker rm postgres
echo -n "Download BASE ODOO CODE from oficial git (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
    cd odoo
    echo "deleting old code..."
    sudo rm -r code
    mkdir code
    echo "Downloading code..."
    git clone --depth 1 https://github.com/odoo/odoo.git code
    chmod -R 777 code
    cd ..
else
    echo -n "Revert all changes to base odoo code? (y/n)? "
    read answer
    if echo "$answer" | grep -iq "^y" ;then
        cd odoo/code
        echo "reverting changes..."
        git reset --hard
        cd ../..
    fi
fi

echo -n "Download chilean addons from git (y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
    cd odoo
    echo "deleting old code..."
    sudo rm -r custom-addons
    sudo rm -r reporting-engine
    mkdir custom-addons
    cd custom-addons
    echo "Downloading https://github.com/dansanti addons..."
    git clone --depth 1 https://github.com/dansanti/l10n_cl_base_rut.git
    git clone --depth 1 https://github.com/dansanti/base_state_ubication.git
    git clone --depth 1 https://github.com/dansanti/l10n_cl_counties.git
    git clone --depth 1 https://github.com/dansanti/l10n_cl_partner_activities.git
    git clone --depth 1 https://github.com/dansanti/l10n_cl_invoice.git
    git clone --depth 1 https://github.com/dansanti/user_signature_key.git
    git clone --depth 1 https://github.com/dansanti/l10n_cl_dte_caf.git
    git clone --depth 1 https://github.com/dansanti/webservices_generic.git
    git clone --depth 1 https://github.com/dansanti/l10n_cl_dte.git
    git clone --depth 1 https://github.com/dansanti/l10n_cl_libro_compra_venta.git
    git clone --depth 1 https://github.com/dansanti/l10n_cl_stock_picking.git
    git clone --depth 1 https://github.com/dansanti/global_discount.git
    cd ..
    echo "Downloading reporting engine..."
    git clone --depth 1 -b 9.0 --single-branch https://github.com/OCA/reporting-engine.git
    cd ..
else
    echo -n "Revert all changes to chilean addons? (y/n)? "
    read answer
    if echo "$answer" | grep -iq "^y" ;then
        echo "reverting changes..."
        cd odoo/custom-addons/l10n_cl_base_rut
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/base_state_ubication
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/l10n_cl_counties
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/l10n_cl_partner_activities
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/l10n_cl_invoice
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/user_signature_key
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/l10n_cl_dte_caf
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/webservices_generic
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/l10n_cl_dte
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/l10n_cl_libro_compra_venta
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/l10n_cl_stock_picking
        git reset --hard
        cd ../../..
        cd odoo/custom-addons/global_discount
        git reset --hard
        cd ../../..
    fi
fi

echo "building containers"
docker-compose build
