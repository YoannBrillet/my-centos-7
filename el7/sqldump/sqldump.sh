#!/bin/bash
#
# sqldump.sh
#
# (c) Niki Kovacs 2020 <info@microlinux.fr>
#
# This script dumps all MySQL databases for further use on a backup server.

# Admin user
DUMPUSER="microlinux"
DUMPGROUP="microlinux"

# MySQL root user
MYSQLUSER="root"
MYSQLPASS="sqlpass"

# Dump directory
BACKUPDIR="/home/${DUMPUSER}/sql"

# Today = YYYYMMDD
TIMESTAMP=$(date "+%Y%m%d")

# Databases

DBNAME[1]="database-site"
DBUSER[1]="dbuser1"
DBPASS[1]="dbpass1"

DBNAME[2]="database-blog"
DBUSER[2]="dbuser2"
DBPASS[2]="dbpass2"

DBNAME[3]="database-mail"
DBUSER[3]="dbuser3"
DBPASS[3]="dbpass3"

DBNAME[4]="database-owncloud"
DBUSER[4]="dbuser4"
DBPASS[4]="dbpass4"

echo "Starting MySQL database dump."

# Create target directory
if [[ ! -d "${BACKUPDIR}" ]] 
then
  echo "Creating target directory ${BACKUPDIR}."
  mkdir -p -m 0770 ${BACKUPDIR}
  if [[ "${?}" -ne 0 ]]
  then
    echo "Could not create target directory ${BACKUPDIR}." >&2
    exit 1
  fi
fi

# Cleanup
echo "Cleaning up target directory."
rm -f ${BACKUPDIR}/*.sql
rm -f ${BACKUPDIR}/*.sql.gz

# Loop through databases
for (( DB=1 ; DB<=${#DBNAME[*]} ; DB++ )) ; do
  echo "Dumping database: ${DBNAME[${DB}]}"
  mysqldump -u ${DBUSER[${DB}]} -p${DBPASS[${DB}]} ${DBNAME[${DB}]} | \
    gzip -c > ${BACKUPDIR}/backup-${DBNAME[${DB}]}-${TIMESTAMP}.sql.gz
done

# Dump all databases
echo "Dumping all databases."
mysqldump -u ${MYSQLUSER} -p${MYSQLPASS} --events --ignore-table=mysql.event \
  --all-databases | gzip -c > ${BACKUPDIR}/backup-all-${TIMESTAMP}.sql.gz

# Set permissions
echo "Setting permissions."
chown -R ${DUMPUSER}:${DUMPGROUP} ${BACKUPDIR}
chmod 0640 ${BACKUPDIR}/*.sql*

exit 0
