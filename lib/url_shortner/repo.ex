defmodule UrlShortener.Repo do
  use Ecto.Repo,
    otp_app: :url_shortner,
    adapter: Ecto.Adapters.Postgres
end
