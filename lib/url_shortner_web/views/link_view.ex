defmodule UrlShortenerWeb.LinkView do
  use UrlShortenerWeb, :view

  def render("show.json", %{link: link}) do
    %{
      status: "success",
      link: link
    }
  end
end
