defmodule TrackVisitWeb.StaffControllerTest do
  use TrackVisitWeb.ConnCase

  alias TrackVisit.Subscriber

  @create_attrs %{active?: true, city_state_origin: "some city_state_origin", city_state_residence: "some city_state_residence", country_origin: "some country_origin", country_residence: "some country_residence", deactivated_by: 42, email: "some email", first_name: "some first_name", last_name: "some last_name", next_kin_name: "some next_kin_name", next_phone: "some next_phone", phone: "some phone", relationship: "some relationship", residence_address: "some residence_address", security_id: "some security_id", user?: true}
  @update_attrs %{active?: false, city_state_origin: "some updated city_state_origin", city_state_residence: "some updated city_state_residence", country_origin: "some updated country_origin", country_residence: "some updated country_residence", deactivated_by: 43, email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", next_kin_name: "some updated next_kin_name", next_phone: "some updated next_phone", phone: "some updated phone", relationship: "some updated relationship", residence_address: "some updated residence_address", security_id: "some updated security_id", user?: false}
  @invalid_attrs %{active?: nil, city_state_origin: nil, city_state_residence: nil, country_origin: nil, country_residence: nil, deactivated_by: nil, email: nil, first_name: nil, last_name: nil, next_kin_name: nil, next_phone: nil, phone: nil, relationship: nil, residence_address: nil, security_id: nil, user?: nil}

  def fixture(:staff) do
    {:ok, staff} = Subscriber.create_staff(@create_attrs)
    staff
  end

  describe "index" do
    test "lists all staffs", %{conn: conn} do
      conn = get(conn, Routes.staff_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Staffs"
    end
  end

  describe "new staff" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.staff_path(conn, :new))
      assert html_response(conn, 200) =~ "New Staff"
    end
  end

  describe "create staff" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.staff_path(conn, :create), staff: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.staff_path(conn, :show, id)

      conn = get(conn, Routes.staff_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Staff"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.staff_path(conn, :create), staff: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Staff"
    end
  end

  describe "edit staff" do
    setup [:create_staff]

    test "renders form for editing chosen staff", %{conn: conn, staff: staff} do
      conn = get(conn, Routes.staff_path(conn, :edit, staff))
      assert html_response(conn, 200) =~ "Edit Staff"
    end
  end

  describe "update staff" do
    setup [:create_staff]

    test "redirects when data is valid", %{conn: conn, staff: staff} do
      conn = put(conn, Routes.staff_path(conn, :update, staff), staff: @update_attrs)
      assert redirected_to(conn) == Routes.staff_path(conn, :show, staff)

      conn = get(conn, Routes.staff_path(conn, :show, staff))
      assert html_response(conn, 200) =~ "some updated city_state_origin"
    end

    test "renders errors when data is invalid", %{conn: conn, staff: staff} do
      conn = put(conn, Routes.staff_path(conn, :update, staff), staff: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Staff"
    end
  end

  describe "delete staff" do
    setup [:create_staff]

    test "deletes chosen staff", %{conn: conn, staff: staff} do
      conn = delete(conn, Routes.staff_path(conn, :delete, staff))
      assert redirected_to(conn) == Routes.staff_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.staff_path(conn, :show, staff))
      end
    end
  end

  defp create_staff(_) do
    staff = fixture(:staff)
    {:ok, staff: staff}
  end
end
