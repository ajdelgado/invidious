#!/bin/bash
gzip -c "${1}" | docker exec -i invidious_invidious-db_1 psql -U kemal
