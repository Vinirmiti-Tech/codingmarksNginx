# This shell file is for installation in ubuntu / debian / linux etc.
# run this file in directory where you want app folder for details view

# change following variable
export MYSQL_PASSWORD=#get20
export NEXTCLOUD_ADMIN_USER=admin
export NEXTCLOUD_ADMIN_PASSWORD=#getAdmin20

echo echoing values
echo $NEXTCLOUD_ADMIN_USER
# assuming you have installed docker and docker compose

sudo docker-compose up -d
