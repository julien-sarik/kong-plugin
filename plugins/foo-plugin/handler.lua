local CustomHandler = {
  VERSION  = "1.0.0",
  PRIORITY = 10,
}

function CustomHandler:access(config)
  -- PHASE: access
  -- Executed for every request from a client and before it is being proxied to the upstream service.
  kong.log("access")
  kong.log.inspect(config.key_names)        -- { "apikey" }
  kong.log.inspect(config.hide_credentials) -- false
  -- kong.ctx.shared: A table that has the same lifetime as the current request. This table is shared between all plugins. It can be used to share data between several plugins in a given request.
  kong.ctx.shared.foo = "hello world"
  -- kong.ctx.plugin: A table that has the same lifetime as the current request. Unlike kong.ctx.shared, this table is not shared between plugins. Instead, it is only visible for the current plugin instance.
  -- kong.request: This module provides a set of functions to retrieve information about the incoming requests made by clients.
  -- kong.response: The downstream response module contains a set of functions for producing and manipulating responses sent back to the client (downstream). Unlike `kong.service.response`, this module allows mutating the response before sending it back to the client.
end

-- commenting as response() can't be used with header_filter() and body_filter()
--function CustomHandler:response(config)
  -- PHASE: 
  -- Replaces both header_filter() and body_filter(). Executed after the whole response has been received from the upstream service, but before sending any part of it to the client.
--  kong.log("response")
--end

function CustomHandler:header_filter(config)
  -- PHASE: header_filter
  -- Executed when all response headers bytes have been received from the upstream service.
  kong.log("header_filter")
  kong.log("response code:", kong.response.get_status())
end

function CustomHandler:body_filter(config)
  -- PHASE: body_filter
  -- Executed for each chunk of the response body received from the upstream service. Since the response is streamed back to the client, it can exceed the buffer size and be streamed chunk by chunk. This function can be called multiple times if the response is large.
  kong.log("body_filter")
end

-- return the created table, so that Kong can execute it
return CustomHandler
