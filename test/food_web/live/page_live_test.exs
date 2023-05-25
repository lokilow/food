defmodule FoodWeb.PageLiveTest do
  use FoodWeb.ConnCase

  test "connected mount", %{conn: conn} do
    {:ok, _view, html} = live(conn, "/")
    assert html =~ "San Francisco Food Trucks</h1>"
  end
end
