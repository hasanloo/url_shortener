defmodule UrlShortener.Repo.Migrations.CreateLinkVisits do
  use Ecto.Migration

  def change do
    create table(:link_visits) do
      add :headers, :map
      add :link_id, references(:link, on_delete: :nothing)

      timestamps()
    end

    create index(:link_visits, [:link_id])
  end
end
