defmodule Food do
  @moduledoc """
  Food is a web app that displays information about the food trucks in San Francisco
  """
  alias Food.Repo
  import Ecto.Query

  @doc """
  Return active food trucks.

  This is a naive approach in the essence of time, and it may be the case
  that there are counfounding variables with this approach
  such that the food trucks returned here are not all active, or not all
  of the active food trucks.
  """
  def active_food_trucks() do
    Food.FoodTruck |> where(status: "APPROVED") |> order_by(asc: :applicant) |> Repo.all()
  end
end
