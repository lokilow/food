defmodule FoodWeb.PageLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <h1 class="text-5xl text-center font-bold my-16">San Francisco Food Trucks</h1>
    """
  end
end
