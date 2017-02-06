#!/bin/bash
set -eo pipefail
shopt -s nullglob

OUTPUT=/docker-entrypoint-initdb.d/mysql-dump.sql
DATADIR=/var/lib/mysql

# if DATADIR is empty
if ! test "$(ls -A "$DATADIR")"; then
	if [ ! -z "${MYSQL_DUMP_URL}" ]; then
		echo -e "\nDownloading from ${MYSQL_DUMP_URL} to ${OUTPUT}...\n"
		curl -pSL -o ${OUTPUT} "${MYSQL_DUMP_URL}"
		chmod 777 ${OUTPUT}
		echo -e "\nDownload of ${MYSQL_DUMP_URL} ended with success.\n"
	fi
fi

exec /entrypoint.sh "$@"
