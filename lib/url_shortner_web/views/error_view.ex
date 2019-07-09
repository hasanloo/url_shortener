defmodule UrlShortenerWeb.ErrorView do
  use UrlShortenerWeb, :view

  alias Phoenix.Controller

  def render("404.json", _assigns) do
    %{errors: %{detail: "Page not found"}}
  end

  def render("500.json", _assigns) do
    %{errors: %{detail: "Internal server error"}}
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(template, _assigns) do
    Controller.status_message_from_template(template)
  end
end
