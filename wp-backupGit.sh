#!/bin/sh

SERVER=douchin-test
DBNAME=douchinWp
DBUSER=userwpD
DBPASS=userwpD2016
MYSQLHOST=127.0.0.1
SRC_BKDIR=/usr/local/backup/$SERVER

# Web Backup
tar czvf /usr/local/backup/$SERVER/$SERVER.wp-htdocs.tar.gz /var/www/html/

# DB Backup
/usr/bin/mysqldump --single-transaction -R -u $DBUSER -h $MYSQLHOST --password=$DBPASS $DBNAME | /bin/gzip >  /usr/local/backup/$SERVER/$DBNAME.`date +\%Y\%m\%d\%H\%M\%S`.dump.gz

