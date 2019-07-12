defmodule UrlShortener.Factory do
  use ExMachina.Ecto, repo: UrlShortener.Repo

  alias UrlShortener.Links.{Link, Visit}

  def link_factory do
    Link{
      url: "http://example.com/about/index.html?uid=12345",
      short_code: "RmPOZWLu"
    }
  end

  def link_factory_noparam do
    Link{
      url: "http://example.com/about/index.html",
      short_code: "rCp+Wu7+"
    }
  end

  def visit_factory do
    Visit{
      link: build(:link),
      headers: %{
        host: "localhost:4000",
        cookie: "MobiotvCookie=true",
        connection: "keep-alive"
      }
    }
  end
end
