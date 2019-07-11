defmodule UrlShortener.Repo.Migrations.AlterVisitsNotNullLinkAndHeaders do
  use Ecto.Migration

  def change do
    alter table(:visits) do
      modify :link_id, :bigint, null: false
      modify :headers, :map, null: false
    end
  end
end
