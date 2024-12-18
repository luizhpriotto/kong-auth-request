FROM kong:3.8

COPY kong.conf /etc/kong/

USER root

COPY ./plugins/kong-auth-request /custom-plugins/kong-auth-request

WORKDIR /custom-plugins/kong-auth-request

RUN luarocks make

USER kong
