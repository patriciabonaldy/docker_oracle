#!/bin/bash

docker run -d -p 1521:1521 -e ORACLE_ALLOW_REMOTE=true -e ORACLE_PASSWORD=testpassword -e RELAX_SECURITY=1 --name=meli bd_meli
