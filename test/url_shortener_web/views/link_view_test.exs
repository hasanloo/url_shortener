defmodule UrlShortenerWeb.LinkViewTest do
  use UrlShortenerWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders show.json" do
    assert render(UrlShortenerWeb.LinkView, "show.json", %{
             link: "http://localhost:4002/r/RmPOZWLu"
           }) ==
             %{status: "success", link: "http://localhost:4002/r/RmPOZWLu"}
  end
end
