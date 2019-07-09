defmodule UrlShortener.Repo.Migrations.UpdateLinkTableAddUniqueIndexShortCode do
  use Ecto.Migration

  def change do
    create unique_index(:link, [:short_code])
  end
end
