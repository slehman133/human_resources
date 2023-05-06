defmodule HumanResourcesWeb.EmployeeApiController do
  use HumanResourcesWeb, :controller

  alias HumanResources.Entry

  def index(conn, _params) do
    employees = Entry.list_employees()
    render(conn, :index, employees: employees)
  end
end
