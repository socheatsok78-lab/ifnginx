ifconfig_io = {
    "method": "{{request_method}}",
    "referer": "{{http_referer}}",
    "ifconfig_hostname": "{{server_name}}",
    "ip": "{{remote_addr}}",
    "lang": "{{http_accept_language}}",
    "encoding": "{{http_accept_encoding}}",
    "mime": "{{http_accept}}",
    "forwarded": "{{proxy_add_x_forwarded_for}}",
    "country_code": "{{geoip2_data_country_iso_code}}",
    "host": "{{remote_addr}}",
    "ifconfig_cmd_hostname": "{{server_name}}",
    "port": {{remote_port}},
    "ua": "{{http_user_agent}}"
}
