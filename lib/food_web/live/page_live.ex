defmodule FoodWeb.PageLive do
  use FoodWeb, :live_view

  def mount(_params, _session, socket) do
    trucks = Food.active_food_trucks()
    {:ok, stream(socket, :trucks, trucks)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="my-16 text-5xl font-bold text-center">San Francisco Food Trucks</h1>
    <table class="mx-auto">
      <tbody id="trucks" phx-update="stream">
        <tr :for={{_dom_id, truck} <- @streams.trucks} class="flex border-b border-cool-gray-300">
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
end
