-- schema.lua
local typedefs = require "kong.db.schema.typedefs"


return {
  name = "foo-plugin",
  fields = {
    {
      protocols = typedefs.protocols_http
    },
    {
      config = {
        type = "record",
        fields = {
          {
            key_names = {
              type = "array",
              required = true,
              elements = typedefs.header_name,
              default = {
                "apikey",
              },
            },
          },
          {
            hide_credentials = {
              type = "boolean",
              default = false,
            },
          },
          {
            demo_config = {
              type = "string",
            },
          },
        },
      },
    },
  },
}
