-- schema.lua
local typedefs = require "kong.db.schema.typedefs"


return {
  name = "bar-plugin",
  fields = {
    {
      protocols = typedefs.protocols_http
    },
    {
      config = {
        type = "record",
        fields = {
        },
      },
    },
  },
}
