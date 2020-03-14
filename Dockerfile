FROM jboss/keycloak:9.0.0

COPY docker-entrypoint.sh /opt/jboss/tools
COPY realm-config/ /opt/jboss/keycloak/realm-config

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD [ "-b", "0.0.0.0", "-Dkeycloak.profile.feature.upload_scripts=enabled",
"-Dkeycloak.migration.action=import", "-Dkeycloak.migration.provider=dir",
"-Dkeycloak.migration.dir=/opt/jboss/keycloak/realm-config", "-Dkeycloak.migration.strategy=OVERWRITE_EXISTING"]
