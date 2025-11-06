#!/bin/bash

docker exec -i splice-validator-postgres-splice-1 pg_dump -U cnadmin validator | \
  aws s3 cp - s3://validator-postgres-backup/validator-$(date -u +"%Y-%m-%dT%H:%M:%S").dump
active_participant_db=$(docker exec splice-validator-participant-1 bash -c 'echo $CANTON_PARTICIPANT_POSTGRES_DB')
docker exec splice-validator-postgres-splice-1 pg_dump -U cnadmin "${active_participant_db}" | \
  aws s3 cp - s3://participant-postgres-backup/${active_participant_db}-$(date -u +"%Y-%m-%dT%H:%M:%S").dump
