defmodule UrlShortener.Links do
  @moduledoc """
  The Links context.
  """

  import Ecto.Query, warn: false
  alias UrlShortener.Repo

  alias UrlShortener.Links.Link
  alias UrlShortener.Links.Visit

  @doc """
  Gets a single link using its short_code.

  ## Examples

      iex> get_link_by_short_code('RmPOZWLu')
      {:ok, %Link{}}

      iex> get_link_by_short_code('RmPOZWLu1')
      {:error, not_found}

  """
  def get_link_by_short_code(short_code) do
    link = Repo.get_by(Link, short_code: short_code)

    case link do
      nil -> {:error, :not_found}
      _ -> {:ok, link}
    end
  end

  @doc """
  Creates a link.

  ## Examples

      iex> create_link(%{field: value})
      {:ok, %Link{}}

      iex> create_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_link(attrs \\ %{}) do
    %Link{}
    |> Link.changeset(attrs)
    |> Repo.insert()
  end

  def create_visit(attrs \\ %{}) do
    %Visit{}
    |> Visit.changeset(attrs)
    |> Repo.insert()
  end
end
