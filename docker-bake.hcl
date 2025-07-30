target "docker-metadata-action" {}
target "github-metadata-action" {}

target "default" {
  inherits = [
    "docker-metadata-action",
    "github-metadata-action",
    "nginx",
  ]
  platforms = [
    "linux/amd64",
    "linux/arm64",
  ]
}

target "dev" {
  inherits = [
    "docker-metadata-action",
    "github-metadata-action",
    "nginx",
  ]
  tags = [ "ghcr.io/socheatsok78-lab/ifnginx:develop" ]
}

target "nginx" {
  contexts = {
    "xnginx" = "target:nginx-builder"
  }
}

target "nginx-builder" {
  args = {
    NGINX_VERSION = "stable"
    ENABLED_MODULES = "brotli geoip2"
  }
  context = "https://github.com/chocolatefrappe/nginx-builder.git#alpine"
}
