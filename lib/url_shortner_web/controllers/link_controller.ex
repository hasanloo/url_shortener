defmodule UrlShortenerWeb.LinkController do
  use UrlShortenerWeb, :controller

  alias UrlShortener.{Links, Events}
  alias UrlShortener.Links.Link
  alias UrlShortenerWeb.Router.Helpers, as: RouterHelpers

  action_fallback(UrlShortenerWeb.FallbackController)

  def create(conn, %{"url" => url}) do
    url_params = create_params(%{url: url})

    link_result =
      case Links.get_link_by_short_code(url_params.short_code) do
        {:ok, %Link{} = link} -> {:ok, link}
        {:error, :not_found} -> Links.create_link(url_params)
      end

    with {:ok, %Link{} = link} <- link_result do
      link =
        RouterHelpers.link_url(
          UrlShortenerWeb.Endpoint,
          :redirect_url,
          link.short_code
        )

      conn
      |> put_status(:created)
      |> render("show.json", link: link)
    end
  end

  def create(conn, _params) do
    conn
    |> put_status(405)
    |> put_view(UrlShortenerWeb.ErrorView)
    |> render(:"405")
  end

  def redirect_url(conn, %{"short_code" => short_code}) do
    with {:ok, %Link{} = link} <- Links.get_link_by_short_code(short_code) do
      link
      |> Events.link_visited(Enum.into(conn.req_headers, %{}))

      conn
      |> redirect(external: get_redirect_url(link.url, conn.query_string))
    end
  end

  defp create_params(params) do
    params
    |> Map.merge(%{short_code: generate_short_code(params.url)})
  end

  defp generate_short_code(url) do
    hash = :crypto.hash(:md5, url)

    hash
    |> Base.encode64()
    |> binary_part(0, 8)
  end

  defp get_redirect_url(url, "") do
    url
  end

  defp get_redirect_url(url, query_string) do
    url
    |> URI.parse()
    |> merge_query_strings(query_string)
    |> URI.to_string()
  end

  defp merge_query_strings(%{query: query} = uri, query_string) when is_binary(query) do
    uri
    |> Map.update(:query, "", &(&1 <> "&" <> query_string))
  end

  defp merge_query_strings(uri, query_string) do
    uri
    |> Map.update(:query, "", fn _qs -> query_string end)
  end
end
