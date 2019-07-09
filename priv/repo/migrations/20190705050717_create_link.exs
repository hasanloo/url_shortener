defmodule UrlShortener.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:link) do
      add :link, :string
      add :short_code, :string

      timestamps()
    end
  end
end
