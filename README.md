This image embeds two dummy plugins into a Kong gateway to demo the simplicity of implementing Kong plugins as well as the ability to share data between plugins. 
# kong-plugin
`handler.lua` and `schema.lua` modules are mandatory.
- handler.lua: the core of your plugin. It is an interface to implement, in which each function will be run at the desired moment in the lifecycle of a request / connection. Plugins define a priority in their `handler.lua` module and at each phase of the lifecycle of the request, Kong will call each corresponding function from greatest to lowest priority.
- schema.lua: your plugin probably has to retain some configuration entered by the user. This module holds the schema of that configuration and defines rules on it, so that the user can only enter valid configuration values.
# build & run
Build with: ```podman build -t kong:custom .```  
Run with: ```podman run --rm -p 8000:8000 -p 8001:8001 -p 8443:8443 -e "KONG_DATABASE=off" -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" -e KONG_DECLARATIVE_CONFIG=/kong.yml -v "$PWD/config.yml:/kong.yml" -e KONG_LOG_LEVEL=debug kong:custom```
# references
PDK documentation is available at https://docs.konghq.com/gateway/3.5.x/plugin-development/pdk/kong.log/
 
