target "default" {
  contexts = {
    "xnginx" = "target:nginx-builder"
  }
  tags = [ "scratchpad/nginx-geoip2" ]
}

target "nginx-builder" {
  args = {
    NGINX_VERSION = "stable"
    ENABLED_MODULES = "brotli geoip2"
  }
  context = "https://github.com/chocolatefrappe/nginx-builder.git#alpine"
}
