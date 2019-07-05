defmodule Eshortner.Repo do
  use Ecto.Repo,
    otp_app: :eshortner,
    adapter: Ecto.Adapters.Postgres
end
