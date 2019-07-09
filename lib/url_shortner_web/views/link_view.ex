defmodule UrlShortenerWeb.LinkView do
  use UrlShortenerWeb, :view

  def render("show.json", %{link: link}) do
    %{link: link}
  end
end
