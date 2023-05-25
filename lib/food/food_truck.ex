defmodule Food.FoodTruck do
  @moduledoc "false"
  use Ecto.Schema

  @primary_key false
  schema "food_trucks" do
    field :id, :integer, primary_key: true
    field :applicant, :string
    field :type, :string
    field :status, :string
    field :location_description, :string
    field :address, :string
    field :food_items, :string
    field :lat, :string
    field :lng, :string
    field :schedule, :string
    field :dayshours, :string
  end
end
