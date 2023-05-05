#!/bin/bash

wdir=/srv/invidious

cur_date=$(date +%d.%m.%Y.%H.%M.%S)
docker exec -t invidious_invidious-db_1 pg_dumpall -c -U kemal > "backup/dump_${cur_date}.sql"
gzip "backup/dump_${cur_date}.sql"

mv "${wdir}/backup/etc_backup.tar.gz" "${wdir}/backup/etc_backup.tar.1.gz"
tar caf "${wdir}/backup/etc_backup.tar.gz" /etc/invidious_container

mv "${wdir}/backup/invidious_invidious-db_1.container.tar" "${wdir}/backup/invidious_invidious-db_1.container.1.tar"
docker export invidious_invidious-db_1 -o "${wdir}/backup/invidious_invidious-db_1.container.tar"

mv "${wdir}/backup/invidious_invidious_1.container.tar" "${wdir}/backup/invidious_invidious_1.container.1.tar"
docker export invidious_invidious_1 -o "${wdir}/backup/invidious_invidious_1.container.tar"
