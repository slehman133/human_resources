defmodule HumanResources.EntryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `HumanResources.Entry` context.
  """

  @doc """
  Generate a employee.
  """
  def employee_fixture(attrs \\ %{}) do
    {:ok, employee} =
      attrs
      |> Enum.into(%{
        date_of_hire: ~D[2023-04-28],
        department: "some department",
        employee_id_number: 42,
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> HumanResources.Entry.create_employee()

    employee
  end
end
