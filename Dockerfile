# Dockerfile
FROM epiclabs/docker-oracle-xe-11g:latest
MAINTAINER Patricia Bonaldy

ENV ORACLE_ALLOW_REMOTE true
ENV ORACLE_PASSWORD testpassword
ENV RELAX_SECURITY 1


#VOLUME ./u01/app/oracle

ADD init.sql /docker-entrypoint-initdb.d/
ADD script_alta_usuario.sql /docker-entrypoint-initdb.d/
ADD script_tablas.sql /docker-entrypoint-initdb.d/

# expose port
EXPOSE 1521:1521