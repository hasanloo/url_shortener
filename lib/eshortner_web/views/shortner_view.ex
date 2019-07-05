defmodule EshortnerWeb.ShortnerView do
  use EshortnerWeb, :view

  def render("index.json", %{links: links}) do
    %{
      text: 'hello',
      links: links
    }
  end
end
