local CustomHandler = {
  VERSION  = "1.0.0",
  PRIORITY = 1,
}

function CustomHandler:access(config)
  -- 'foo' variable from the shared context has been set by the foo-plugin
  kong.log("kong.ctx.shared.foo:", kong.ctx.shared.foo)
end

return CustomHandler
