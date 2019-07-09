defmodule UrlShortener.Repo.Migrations.UpdateLinkTableRenameLinkToUrl do
  use Ecto.Migration

  def change do
    rename table(:link), :link, to: :url
  end
end
