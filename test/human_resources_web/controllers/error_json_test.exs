defmodule HumanResourcesWeb.ErrorJSONTest do
  use HumanResourcesWeb.ConnCase, async: true

  test "renders 404" do
    assert HumanResourcesWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert HumanResourcesWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
