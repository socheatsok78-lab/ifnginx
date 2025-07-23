ifconfig_io = {
    "method": "t(request_method)",
    "referer": "t(http_referer)",
    "ifconfig_hostname": "t(server_name)",
    "ip": "t(remote_addr)",
    "lang": "t(http_accept_language)",
    "encoding": "t(http_accept_encoding)",
    "mime": "t(http_accept)",
    "forwarded": "t(proxy_add_x_forwarded_for)",
    "country_code": "t(geoip2_data_country_iso_code)",
    "host": "t(remote_addr)",
    "ifconfig_cmd_hostname": "t(server_name)",
    "port": t(remote_port),
    "ua": "t(http_user_agent)"
}
