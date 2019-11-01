defmodule TrackVisit.CompanyTest do
  use TrackVisit.DataCase

  alias TrackVisit.Company

  describe "visitlogs" do
    alias TrackVisit.Company.VisitLog

    @valid_attrs %{bage: "some bage", check_in_time: ~N[2010-04-17 14:00:00], check_out_time: ~N[2010-04-17 14:00:00], end_time: ~N[2010-04-17 14:00:00], start_time: ~N[2010-04-17 14:00:00], visit_reason: "some visit_reason", visitor_pix: "some visitor_pix"}
    @update_attrs %{bage: "some updated bage", check_in_time: ~N[2011-05-18 15:01:01], check_out_time: ~N[2011-05-18 15:01:01], end_time: ~N[2011-05-18 15:01:01], start_time: ~N[2011-05-18 15:01:01], visit_reason: "some updated visit_reason", visitor_pix: "some updated visitor_pix"}
    @invalid_attrs %{bage: nil, check_in_time: nil, check_out_time: nil, end_time: nil, start_time: nil, visit_reason: nil, visitor_pix: nil}

    def visit_log_fixture(attrs \\ %{}) do
      {:ok, visit_log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_visit_log()

      visit_log
    end

    test "list_visitlogs/0 returns all visitlogs" do
      visit_log = visit_log_fixture()
      assert Company.list_visitlogs() == [visit_log]
    end

    test "get_visit_log!/1 returns the visit_log with given id" do
      visit_log = visit_log_fixture()
      assert Company.get_visit_log!(visit_log.id) == visit_log
    end

    test "create_visit_log/1 with valid data creates a visit_log" do
      assert {:ok, %VisitLog{} = visit_log} = Company.create_visit_log(@valid_attrs)
      assert visit_log.bage == "some bage"
      assert visit_log.check_in_time == ~N[2010-04-17 14:00:00]
      assert visit_log.check_out_time == ~N[2010-04-17 14:00:00]
      assert visit_log.end_time == ~N[2010-04-17 14:00:00]
      assert visit_log.start_time == ~N[2010-04-17 14:00:00]
      assert visit_log.visit_reason == "some visit_reason"
      assert visit_log.visitor_pix == "some visitor_pix"
    end

    test "create_visit_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_visit_log(@invalid_attrs)
    end

    test "update_visit_log/2 with valid data updates the visit_log" do
      visit_log = visit_log_fixture()
      assert {:ok, %VisitLog{} = visit_log} = Company.update_visit_log(visit_log, @update_attrs)
      assert visit_log.bage == "some updated bage"
      assert visit_log.check_in_time == ~N[2011-05-18 15:01:01]
      assert visit_log.check_out_time == ~N[2011-05-18 15:01:01]
      assert visit_log.end_time == ~N[2011-05-18 15:01:01]
      assert visit_log.start_time == ~N[2011-05-18 15:01:01]
      assert visit_log.visit_reason == "some updated visit_reason"
      assert visit_log.visitor_pix == "some updated visitor_pix"
    end

    test "update_visit_log/2 with invalid data returns error changeset" do
      visit_log = visit_log_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_visit_log(visit_log, @invalid_attrs)
      assert visit_log == Company.get_visit_log!(visit_log.id)
    end

    test "delete_visit_log/1 deletes the visit_log" do
      visit_log = visit_log_fixture()
      assert {:ok, %VisitLog{}} = Company.delete_visit_log(visit_log)
      assert_raise Ecto.NoResultsError, fn -> Company.get_visit_log!(visit_log.id) end
    end

    test "change_visit_log/1 returns a visit_log changeset" do
      visit_log = visit_log_fixture()
      assert %Ecto.Changeset{} = Company.change_visit_log(visit_log)
    end
  end

  describe "departments" do
    alias TrackVisit.Company.Department

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def department_fixture(attrs \\ %{}) do
      {:ok, department} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Company.create_department()

      department
    end

    test "list_departments/0 returns all departments" do
      department = department_fixture()
      assert Company.list_departments() == [department]
    end

    test "get_department!/1 returns the department with given id" do
      department = department_fixture()
      assert Company.get_department!(department.id) == department
    end

    test "create_department/1 with valid data creates a department" do
      assert {:ok, %Department{} = department} = Company.create_department(@valid_attrs)
      assert department.name == "some name"
    end

    test "create_department/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Company.create_department(@invalid_attrs)
    end

    test "update_department/2 with valid data updates the department" do
      department = department_fixture()
      assert {:ok, %Department{} = department} = Company.update_department(department, @update_attrs)
      assert department.name == "some updated name"
    end

    test "update_department/2 with invalid data returns error changeset" do
      department = department_fixture()
      assert {:error, %Ecto.Changeset{}} = Company.update_department(department, @invalid_attrs)
      assert department == Company.get_department!(department.id)
    end

    test "delete_department/1 deletes the department" do
      department = department_fixture()
      assert {:ok, %Department{}} = Company.delete_department(department)
      assert_raise Ecto.NoResultsError, fn -> Company.get_department!(department.id) end
    end

    test "change_department/1 returns a department changeset" do
      department = department_fixture()
      assert %Ecto.Changeset{} = Company.change_department(department)
    end
  end
end
