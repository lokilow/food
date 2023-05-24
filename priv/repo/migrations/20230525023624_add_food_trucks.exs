defmodule Food.Repo.Migrations.AddFoodTrucks do
  use Ecto.Migration

  def change do
    create table("food_trucks", primary_key: false) do
      add :id, :int, primary_key: true
      add :applicant, :text
      add :type, :text
      add :status, :text
      add :location_description, :text
      add :address, :text
      add :food_items, :text
      add :lat, :text
      add :lng, :text
      add :schedule, :text
      add :dayshours, :text
    end
  end
end
