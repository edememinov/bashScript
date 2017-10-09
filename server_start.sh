#! /bin/sh
##############
#Run B-Infomred Odoo server
##############
#Navigate to Odoo directory
cd /media/edememinov/2838698A386957B8/b-informed/odoo
#Run server
./odoo-bin -d v10dev --addons-path="../odoo-enterprise, ../odoo/addons, ../b-informed"

