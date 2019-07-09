defmodule UrlShortener.Factory do
  use ExMachina.Ecto, repo: UrlShortener.Repo

  def link_factory do
    %UrlShortener.Links.Link{
      url: "http://example.com/about/index.html?uid=12345",
      short_code: "RmPOZWLu"
    }
  end
end
