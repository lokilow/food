defmodule Mix.Tasks.LoadData do
  @moduledoc "Loads food truck data from csv file into postgres.  Use a mix task instead of a seed in case we want to update the database at a future date when a new csv is released."

  @shortdoc "Load data"

  use Mix.Task
  alias Food.Repo

  @csv Path.expand("priv/data/Mobile_Food_Facility_Permit.csv")
  NimbleCSV.define(Parser, separator: ",", escape: "\"")

  @impl Mix.Task
  @requirements ["app.start"]
  def run(_args) do
    @csv
    |> File.stream!(read_ahead: 100_000)
    |> Parser.parse_stream()
    |> Enum.map(&select_fields/1)
    |> then(&Repo.insert_all(Food.FoodTruck, &1, on_conflict: :replace_all, conflict_target: :id))
  end

  # This is the header
  # locationid,Applicant,FacilityType,cnn,LocationDescription,Address,blocklot,block,lot,permit,Status,FoodItems,X,Y,Latitude,Longitude,Schedule,dayshours,NOISent,Approved,Received,PriorPermit,ExpirationDate,Location,Fire Prevention Districts,Police Districts,Supervisor Districts,Zip Codes,Neighborhoods (old)
  defp select_fields(row) do
    [
      id,
      applicant,
      type,
      _cnn,
      location_description,
      address,
      _blocklot,
      _block,
      _lot,
      _permit,
      status,
      food_items,
      _x,
      _y,
      lat,
      lng,
      schedule,
      dayshours,
      _noi_sent,
      _approved,
      _received,
      _prior_permit,
      _expiration_date,
      _location
      | _
    ] = row

    %{
      id: String.to_integer(id),
      applicant: applicant,
      type: type,
      location_description: location_description,
      address: address,
      status: status,
      food_items: food_items,
      lat: lat,
      lng: lng,
      schedule: schedule,
      dayshours: dayshours
    }
  end
end
