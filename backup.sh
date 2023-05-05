#!/bin/bash

wdir=/srv/invidious

mv "${wdir}/backup/db_backup.tar.gz" "${wdir}/backup/db_backup.tar.1.gz"
docker stop invidious_invidious-db_1
docker run --rm --volumes-from invidious_invidious-db_1 -v "${wdir}/backup":/backup ubuntu tar caf /backup/db_backup.tar.gz /var/lib/postgresql/data
docker start invidious_invidious-db_1

mv "${wdir}/backup/etc_backup.tar.gz" "${wdir}/backup/etc_backup.tar.1.gz"
tar caf "${wdir}/backup/etc_backup.tar.gz" /etc/invidious_container

mv "${wdir}/backup/invidious_invidious-db_1.container.tar" "${wdir}/backup/invidious_invidious-db_1.container.1.tar"
docker export invidious_invidious-db_1 -o "${wdir}/backup/invidious_invidious-db_1.container.tar"

mv "${wdir}/backup/invidious_invidious_1.container.tar" "${wdir}/backup/invidious_invidious_1.container.1.tar"
docker export invidious_invidious_1 -o "${wdir}/backup/invidious_invidious_1.container.tar"
