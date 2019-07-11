defmodule UrlShortener.Repo.Migrations.RenameTableNamesToPlural do
  use Ecto.Migration

  def change do
    rename table(:link), to: table(:links)
    rename table(:link_visits), to: table(:visits)
  end
end
