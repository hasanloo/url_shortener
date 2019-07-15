defmodule UrlShortener.Events do
  use GenServer
  alias Phoenix.PubSub

  alias UrlShortener.Links

  @pubsub_topic "events"

  def start_link(_opts \\ []) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def link_visited(link, headers) do
    PubSub.broadcast(
      UrlShortener.PubSub,
      @pubsub_topic,
      {:visit, link, headers}
    )
  end

  @impl true
  def init(_) do
    PubSub.subscribe(UrlShortener.PubSub, @pubsub_topic)
    {:ok, %{}}
  end

  @impl true
  def handle_info({:visit, link, headers}, _state) do
    %{link_id: link.id, headers: headers}
    |> Links.create_visit()

    {:noreply, %{}}
  end
end
