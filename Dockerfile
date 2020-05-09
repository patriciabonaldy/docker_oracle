# Dockerfile
#FROM epiclabs/docker-oracle-xe-11g:latest
FROM dockerhelp/docker-oracle-ee-18c:latest
MAINTAINER Patricia Bonaldy

ENV ORACLE_ALLOW_REMOTE true
ENV ORACLE_PASSWORD testpassword
ENV RELAX_SECURITY 1


#VOLUME ./u01/app/oracle

#ADD scripts/init.sql /docker-entrypoint-initdb.d/
ADD scripts/script_alta_usuario.sql /
ADD create_schema.sh /
#ADD scripts/script_tablas.sql /docker-entrypoint-initdb.d/

# expose port
EXPOSE 1521:1521