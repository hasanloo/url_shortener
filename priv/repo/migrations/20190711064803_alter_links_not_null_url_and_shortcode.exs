defmodule UrlShortener.Repo.Migrations.AlterLinksNotNullUrlAndShortcode do
  use Ecto.Migration

  def change do
    alter table(:links) do
      modify :url, :string, null: false
      modify :short_code, :string, null: false
    end
  end
end
