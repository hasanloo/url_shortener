defmodule UrlShortener.Links.Visit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visits" do
    field :headers, :map

    belongs_to(:link, UrlShortener.Links.Link)

    timestamps()
  end

  @doc false
  def changeset(visit, attrs) do
    visit
    |> cast(attrs, [:headers, :link_id])
    |> cast_assoc(:link)
    |> assoc_constraint(:link)
    |> validate_required([:headers, :link_id])
  end
end
