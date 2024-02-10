package = "bar-plugin"
version = "0.0-1"
source = {
   url = "https://github.com/julien-sarik/kong-plugin"
}
description = {
   homepage = "https://github.com/julien-sarik/kong-plugin",
   license = "MIT"
}
dependencies = {
  "kong >= 0.14"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.kong-plugin-bar-plugin.handler"] = "kong/plugins/bar-plugin/handler.lua",
      ["kong.plugins.kong-plugin-bar-plugin.schema"] = "kong/plugins/bar-plugin/schema.lua",
   }
}
