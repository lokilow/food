defmodule FoodWeb.PageLive do
  use FoodWeb, :live_view

  def mount(_params, _session, socket) do
    trucks = Food.active_food_trucks()
    {:ok, assign(socket, trucks: trucks, food_query: "", results: trucks)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="my-16 text-5xl font-bold text-center">San Francisco Food Trucks</h1>
    <form phx-change="search-foods">
      <.input type="text" name="query" value="" label="Search by food items" phx-debounce="300" />
    </form>
    <table class="mx-auto mt-12">
      <tbody id="trucks">
        <tr :for={truck <- @results} class="flex border-b border-cool-gray-300">
          <td class="w-40"><%= truck.applicant %></td>
          <td class="w-64 ml-4"><%= truck.food_items %></td>
          <td class="ml-4 w-72"><%= truck.location_description %></td>
          <td class="ml-4">
            <a href={"#{truck.schedule}"}><.icon name="hero-calendar-solid" /></a>
          </td>
        </tr>
      </tbody>
    </table>
    """
  end

  def handle_event("search-foods", %{"query" => query}, socket) do
    results = Enum.filter(socket.assigns.trucks, &String.contains?(&1.food_items, query))
    {:noreply, assign(socket, food_query: query, results: results)}
  end
end
