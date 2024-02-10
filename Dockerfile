FROM docker.io/kong:3.1.1-alpine
# Ensure any patching steps are executed as root user
USER root

# Add custom plugin to the image
RUN mkdir -p /plugins/kong/plugins/
COPY plugins/ /plugins/kong/plugins/
COPY foo-plugin-0.0-1.rockspec bar-plugin-0.0-1.rockspec /plugins

WORKDIR /plugins

RUN luarocks make foo-plugin-0.0-1.rockspec
RUN luarocks make bar-plugin-0.0-1.rockspec 

ENV KONG_PLUGINS=bundled,foo-plugin,bar-plugin

# Ensure kong user is selected for image execution
USER kong
