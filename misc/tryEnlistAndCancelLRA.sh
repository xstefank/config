#!/bin/bash

LRA=$(curl -X POST localhost:8080/lra-coordinator/start -H "Content-Type: application/json" -d '{"parentLRA":"", "clientId":"my-client", "timelimit":"0"}' | sed 's/"//g' | sed 's#.*/##')

echo "LRA: $LRA"

curl -X PUT http://localhost:8080/lra-coordinator/$LRA -H "LRA_HTTP_HEADER: http://localhost:8080/lra-coordinator/$LRA" -H 'Link: <http://localhost:8180/lracontroller/compensate>; rel="compensate"; title="compensateURI"; type="text/plain",<http://localhost:8180/lracontroller/complete>; rel="complete"; title="completeURI"; type="text/plain",<http://localhost:8180/lracontroller/forget>; rel="forget"; title="forgetURI"; type="text/plain",<http://localhost:8180/lracontroller/status>; rel="status"; title="statusURI"; type="text/plain"' -i

curl -X PUT http://localhost:8080/lra-coordinator/$LRA/cancel -i

