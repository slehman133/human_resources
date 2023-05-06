defmodule HumanResourcesWeb.EmployeeApiJSON do
  def index(%{employees: employees}) do
    %{
      data:
        for(employee <- employees) do
          %{
            id: employee.id,
            employee_id_number: employee.employee_id_number,
            department: employee.department,
            date_of_hire: employee.date_of_hire,
            first_name: employee.first_name,
            last_name: employee.last_name
          }
        end
    }
  end
end
