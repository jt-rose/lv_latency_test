defmodule LvLatencyTestWeb.DemoLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  use Phoenix.LiveView
  alias Phoenix.LiveView.JS

  def render(assigns) do
    ~H"""
    <div class="flex flex-col justify-center">
      <h1 class="text-2xl text-center">Count: <%= @count %></h1>
      <div class="text-center">
        <button class="p-2 text-3xl hover:text-blue-500" phx-click="inc">+</button>
        <button class="p-2 text-3xl hover:text-red-600" phx-click="dec">-</button>
      </div>
      <div class="flex justify-center">
        <button
          class="w-32 p-1 text-white bg-blue-500 rounded hover:bg-blue-600"
          phx-click={JS.toggle(to: "#elem1")}
        >
          Toggle via JS
        </button>
      </div>

      <div id="elem1">
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis autem optio voluptatem, architecto asperiores nam, sunt distinctio animi neque consequatur consequuntur dolore cupiditate voluptatum dolor a esse exercitationem sequi reiciendis!
      </div>
    </div>
    <div class="flex justify-center">
      <button class="w-32 p-1 text-white bg-blue-500 rounded hover:bg-blue-600" phx-click="toggle">
        Toggle via LiveView
      </button>
    </div>
    <%= if @show_text do %>
      <div id="elem2">
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis autem optio voluptatem, architecto asperiores nam, sunt distinctio animi neque consequatur consequuntur dolore cupiditate voluptatum dolor a esse exercitationem sequi reiciendis!
      </div>
    <% end %>
    """
  end

  def mount(_params, _session, socket) do
    count = 1
    show_text = true
    {:ok, assign(socket, count: count, show_text: show_text)}
  end

  def handle_event("inc", _params, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def handle_event("dec", _params, socket) do
    {:noreply, update(socket, :count, &(&1 - 1))}
  end

  def handle_event("toggle", _params, socket) do
    {:noreply, update(socket, :show_text, &(!&1))}
  end
end
