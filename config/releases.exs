import Config

secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
application_port = System.fetch_env!("APP_PORT")

config :eshortner, DockerElixir19ReleaseWeb.Endpoint,
  http: [:inet6, port: String.to_integer(application_port)],
  secret_key_base: secret_key_base
