defmodule UrlShortenerWeb.LinkControllerTest do
  use UrlShortenerWeb.ConnCase

  alias UrlShortener.Links

  @valid_attrs %{url: "http://example.com/about/index.html?uid=12345", short_code: "RmPOZWLu"}
  @valid_attrs_noparam %{url: "http://example.com/about/index.html", short_code: "RmPOZWLu"}

  describe "create/2" do
    test "Creates, and responds with a newly created shortened link if attributes are valid", %{
      conn: conn
    } do
      conn = post(conn, Routes.link_path(conn, :create), url: @valid_attrs.url)

      link = json_response(conn, 201)["link"]

      assert link == "http://localhost:4002/r/RmPOZWLu"
    end

    test "Find and return the link if url already exists in the database", %{
      conn: conn
    } do
      Links.create_link(@valid_attrs)

      conn = post(conn, Routes.link_path(conn, :create), url: @valid_attrs.url)

      link = json_response(conn, 201)["link"]

      assert link == "http://localhost:4002/r/RmPOZWLu"
    end

    test "Returns an error and does not create a link if attributes are invalid", %{
      conn: conn
    } do
      conn = post(conn, Routes.link_path(conn, :create), url2: @valid_attrs.url)

      assert json_response(conn, 405) =~ "Method Not Allowed"
    end
  end

  describe "redirect_url/2" do
    test "Redirect to actual url if it can find by the short_code", %{
      conn: conn
    } do
      Links.create_link(@valid_attrs)

      conn = get(conn, Routes.link_path(conn, :redirect_url, @valid_attrs.short_code))

      assert redirected_to(conn) =~ @valid_attrs.url
    end

    test "Redirect to actual url if it can find by the short_code and there is no param in the actual url",
         %{
           conn: conn
         } do
      Links.create_link(@valid_attrs_noparam)

      conn = get(conn, Routes.link_path(conn, :redirect_url, @valid_attrs_noparam.short_code))

      assert redirected_to(conn) =~ @valid_attrs_noparam.url
    end

    test "Redirect to actual url if it can find by the short_code with additional params", %{
      conn: conn
    } do
      Links.create_link(@valid_attrs)

      conn =
        get(conn, Routes.link_path(conn, :redirect_url, @valid_attrs.short_code, param: "test"))

      assert redirected_to(conn) =~ @valid_attrs.url <> "&" <> "param=test"
    end

    test "Redirect to actual url if it can find by the short_code with additional params(actual url without param)",
         %{
           conn: conn
         } do
      Links.create_link(@valid_attrs_noparam)

      conn =
        get(
          conn,
          Routes.link_path(conn, :redirect_url, @valid_attrs_noparam.short_code, param: "test")
        )

      assert redirected_to(conn) =~ @valid_attrs_noparam.url <> "?" <> "param=test"
    end

    test "Returns an error when can not find the url by short_code", %{
      conn: conn
    } do
      conn = get(conn, Routes.link_path(conn, :redirect_url, @valid_attrs.short_code))

      assert html_response(conn, 404) =~ "Not Found"
    end
  end
end
