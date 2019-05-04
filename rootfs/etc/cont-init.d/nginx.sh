#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Phlex
# Configures NGINX for use with Phlex
# ==============================================================================
declare certfile
declare keyfile

bashio::config.require.ssl

# Enable SSL
if bashio::config.true 'ssl'; then
    rm /etc/nginx/nginx.conf
    mv /etc/nginx/nginx-ssl.conf /etc/nginx/nginx.conf

    certfile=$(bashio::config 'certfile')
    keyfile=$(bashio::config 'keyfile')

    sed -i "s/%%certfile%%/${certfile}/g" /etc/nginx/nginx.conf
    sed -i "s/%%keyfile%%/${keyfile}/g" /etc/nginx/nginx.conf
fi

# Set premissions
chown nginx:nginx -R /opt
