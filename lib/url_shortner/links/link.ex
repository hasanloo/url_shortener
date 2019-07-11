defmodule UrlShortener.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  schema "links" do
    field :url, :string
    field :short_code, :string

    has_many(:visits, UrlShortener.Links.Visit, foreign_key: :link_id)

    timestamps()
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:url, :short_code])
    |> validate_required([:url, :short_code])
    |> unique_constraint(:short_code)
  end
end
