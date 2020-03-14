FROM jboss/keycloak:latest

COPY docker-entrypoint.sh /opt/jboss/tools
COPY realm-config/ /opt/jboss/keycloak/realm-config

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD [ "-b", "0.0.0.0", "-Dkeycloak.migration.action=import", "-Dkeycloak.migration.provider=dir", "-Dkeycloak.migration.dir=/opt/jboss/keycloak/realm-config", "-Dkeycloak.migration.strategy=OVERWRITE_EXISTING", "-Djboss.socket.binding.port-offset=1000", "-Dkeycloak.profile.feature.upload_scripts=enabled"]