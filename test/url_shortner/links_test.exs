defmodule UrlShortener.LinksTest do
  use UrlShortener.DataCase

  alias UrlShortener.Links

  describe "link" do
    alias UrlShortener.Links.Link

    @valid_attrs %{url: "http://example.com/about/index.html?uid=123456", short_code: "s5Rs9quW"}
    @valid_attrs_nonexistent %{
      url: "http://example.com/about/index.html?uid=123456",
      short_code: "S5Rs9quW"
    }
    @invalid_attrs %{url: nil, short_code: nil}

    def link_fixture(attrs \\ %{}) do
      {:ok, link} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Links.create_link()

      link
    end

    test "get_link_by_short_code/1 returns the link with given short_code" do
      link = link_fixture()
      assert Links.get_link_by_short_code(link.short_code) == {:ok, link}
    end

    test "get_link_by_short_code/1 returns not_found with nonexistent short_code" do
      assert Links.get_link_by_short_code(@valid_attrs_nonexistent.short_code) ==
               {:error, :not_found}
    end

    test "create_link/1 with valid data creates a link" do
      assert {:ok, %Link{} = link} = Links.create_link(@valid_attrs)
      assert link.url == "http://example.com/about/index.html?uid=123456"
      assert link.short_code == "s5Rs9quW"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Links.create_link(@invalid_attrs)
    end
  end
end
