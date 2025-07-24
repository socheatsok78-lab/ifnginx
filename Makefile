it:
build:
	docker buildx bake --load
run: build
	docker run --rm -it -p 80:80 scratchpad/nginx-geoip2
