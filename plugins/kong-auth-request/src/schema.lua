local typedefs = require "kong.db.schema.typedefs"

return {
  name = "kong-auth-request",
  fields = {
    {
      consumer = typedefs.no_consumer, -- Não associar a um consumidor
    },
    {
      config = {
        type = "record", -- Configuração principal
        fields = {
          {
            auth_uri = {
              type = "string",
              required = true, -- Campo obrigatório
            },
          },
          {
            origin_request_headers_to_forward_to_auth = {
              type = "array", -- Array para cabeçalhos
              elements = { type = "string" }, -- Cada elemento é uma string
              default = {}, -- Valor padrão: array vazio
            },
          },
          {
            auth_response_headers_to_forward = {
              type = "array", -- Outro array
              elements = { type = "string" }, -- Cada elemento é uma string
              default = {}, -- Valor padrão
            },
          },
          {
            timeout = {
              type = "number", -- Timeout numérico
              default = 10000, -- Padrão: 10 segundos
            },
          },
          {
            keepalive_timeout = {
              type = "number",
              default = 60000, -- Padrão: 60 segundos
            },
          },
          {
            ignored_paths = {
              type = "array",
              elements = { type = "string" }, -- Cada path ignorado será uma string
              required = false,
              default = {}, -- Define um valor padrão vazio
            },
          }
        },
      },
    },
  },
}
