defmodule HumanResources.EntryTest do
  use HumanResources.DataCase

  alias HumanResources.Entry

  describe "employees" do
    alias HumanResources.Entry.Employee

    import HumanResources.EntryFixtures

    @invalid_attrs %{date_of_hire: nil, department: nil, employee_id_number: nil, first_name: nil, last_name: nil}

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Entry.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Entry.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      valid_attrs = %{date_of_hire: ~D[2023-04-28], department: "some department", employee_id_number: 42, first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %Employee{} = employee} = Entry.create_employee(valid_attrs)
      assert employee.date_of_hire == ~D[2023-04-28]
      assert employee.department == "some department"
      assert employee.employee_id_number == 42
      assert employee.first_name == "some first_name"
      assert employee.last_name == "some last_name"
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entry.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      update_attrs = %{date_of_hire: ~D[2023-04-29], department: "some updated department", employee_id_number: 43, first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %Employee{} = employee} = Entry.update_employee(employee, update_attrs)
      assert employee.date_of_hire == ~D[2023-04-29]
      assert employee.department == "some updated department"
      assert employee.employee_id_number == 43
      assert employee.first_name == "some updated first_name"
      assert employee.last_name == "some updated last_name"
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Entry.update_employee(employee, @invalid_attrs)
      assert employee == Entry.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Entry.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Entry.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Entry.change_employee(employee)
    end
  end
end
