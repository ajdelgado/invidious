#!/bin/bash
gzip -dc "${1}" | docker exec -i invidious_invidious-db_1 psql invidious kemal
