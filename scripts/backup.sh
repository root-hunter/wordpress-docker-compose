#!/bin/sh

TODAY=$(date +'%Y_%m_%d_%H_%M_%S')
TIMESTAMP=$(date +%s)

#BACKUP DATABASE
DB_FILENAME=bck_db_${TODAY}_${TIMESTAMP}.sql
DB_FILEPATH=/home/${DB_FILENAME}
DB_EXP_FILE=/home/debian/wordpress-compose/backups/$DB_FILENAME

DB_COMMAND="mysqldump -u wordpress -p$DB_USER_PASS wordpress > ${DB_FILEPATH}"

echo $DB_COMMAND;

docker exec -d web_mariadb /bin/bash -c "${DB_COMMAND}"
docker cp web_mariadb:${DB_FILEPATH} /home/debian/wordpress-compose/backups/
node /home/debian/wordpress-compose/tools/backup.js database $DB_EXP_FILE
rm $DB_EXP_FILE

#BACKUP WORDPRESS
DB_FILENAME=bck_wp_${TODAY}_${TIMESTAMP}.zip
WP_EXP_FILE=/home/debian/wordpress-compose/backups/${DB_FILENAME}

cd /home/debian/wordpress-compose/wp_data/; zip -9 -r $WP_EXP_FILE * -T
node /home/debian/wordpress-compose/tools/backup.js wordpress $WP_EXP_FILE
