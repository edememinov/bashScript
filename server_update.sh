#! /bin/sh
##############
#Run B-Infomred Odoo server
##############

#Kill all python processes
pkill -9 python
#Define file
MODULE_FILE='/home/edememinov/Desktop/Development/B-Informed/updated_modules.txt'
echo "Previously updated modules:"
cat -n $MODULE_FILE
#Navigate to Odoo directory
cd /media/edememinov/2838698A386957B8/b-informed/odoo
#prompt for update name
read -p "Module name or number of previously updated modules:" input
#Check if input is a number
if [ $input -eq $input 2>/dev/null ]; then
	#Get the line with the input number
   line=$(sed -n "${input}p" "$MODULE_FILE")
   #Run server
   echo "./odoo-bin -d binfo_dev --db-filter='binfo_dev' --addons-path='../odoo-enterprise, ../odoo/addons, ../b-informed' -u '$line'"
   ./odoo-bin -d binfo_dev --db-filter="binfo_dev" --addons-path="../odoo-enterprise, ../odoo/addons, ../b-informed" -u "$line"

else
	#Save name to file
	if grep -qF "$input" $MODULE_FILE;then
	# code for if it exists
		echo "Nice"
	else
		echo "$input" >> $MODULE_FILE
		cat $MODULE_FILE
	fi 
	#Run server
	echo "./odoo-bin -d binfo_dev --db-filter='binfo_dev' --addons-path='../odoo-enterprise, ../odoo/addons, ../b-informed' -u '$input'"
	./odoo-bin -d binfo_dev --db-filter="binfo_dev" --addons-path="../odoo-enterprise, ../odoo/addons, ../b-informed" -u "$input"
fi
