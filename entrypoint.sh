#!/bin/bash
set -eo pipefail
shopt -s nullglob

OUTPUT=/docker-entrypoint-initdb.d/mysql-dump.sql
DATADIR=/var/lib/mysql

IS_DATADIR_EMPTY=$(ls -A "$DATADIR")
echo -e "IS_DATADIR_EMPTY: ${IS_DATADIR_EMPTY}"
echo -e "MYSQL_FORCE_DUMP:  ${MYSQL_FORCE_DUMP}"
# if DATADIR is empty or dump load is being forced
if [[ ! -z "${IS_DATADIR_EMPTY}" ]] || [[ "${MYSQL_FORCE_DUMP}" == "true" ]]; then
	if [ ! -z "${MYSQL_DUMP_URL}" ]; then
		echo -e "\nDownloading from ${MYSQL_DUMP_URL} to ${OUTPUT}...\n"
		curl -pSL -o ${OUTPUT} "${MYSQL_DUMP_URL}"
		chmod 777 ${OUTPUT}
		echo -e "\nDownload of ${MYSQL_DUMP_URL} ended with success.\n"
	fi
fi

exec /entrypoint.sh "$@"
