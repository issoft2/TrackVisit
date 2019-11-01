defmodule TrackVisitWeb.VisitLogControllerTest do
  use TrackVisitWeb.ConnCase

  alias TrackVisit.Company

  @create_attrs %{bage: "some bage", check_in_time: ~N[2010-04-17 14:00:00], check_out_time: ~N[2010-04-17 14:00:00], end_time: ~N[2010-04-17 14:00:00], start_time: ~N[2010-04-17 14:00:00], visit_reason: "some visit_reason", visitor_pix: "some visitor_pix"}
  @update_attrs %{bage: "some updated bage", check_in_time: ~N[2011-05-18 15:01:01], check_out_time: ~N[2011-05-18 15:01:01], end_time: ~N[2011-05-18 15:01:01], start_time: ~N[2011-05-18 15:01:01], visit_reason: "some updated visit_reason", visitor_pix: "some updated visitor_pix"}
  @invalid_attrs %{bage: nil, check_in_time: nil, check_out_time: nil, end_time: nil, start_time: nil, visit_reason: nil, visitor_pix: nil}

  def fixture(:visit_log) do
    {:ok, visit_log} = Company.create_visit_log(@create_attrs)
    visit_log
  end

  describe "index" do
    test "lists all visitlogs", %{conn: conn} do
      conn = get(conn, Routes.visit_log_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Visitlogs"
    end
  end

  describe "new visit_log" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.visit_log_path(conn, :new))
      assert html_response(conn, 200) =~ "New Visit log"
    end
  end

  describe "create visit_log" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.visit_log_path(conn, :create), visit_log: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.visit_log_path(conn, :show, id)

      conn = get(conn, Routes.visit_log_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Visit log"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.visit_log_path(conn, :create), visit_log: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Visit log"
    end
  end

  describe "edit visit_log" do
    setup [:create_visit_log]

    test "renders form for editing chosen visit_log", %{conn: conn, visit_log: visit_log} do
      conn = get(conn, Routes.visit_log_path(conn, :edit, visit_log))
      assert html_response(conn, 200) =~ "Edit Visit log"
    end
  end

  describe "update visit_log" do
    setup [:create_visit_log]

    test "redirects when data is valid", %{conn: conn, visit_log: visit_log} do
      conn = put(conn, Routes.visit_log_path(conn, :update, visit_log), visit_log: @update_attrs)
      assert redirected_to(conn) == Routes.visit_log_path(conn, :show, visit_log)

      conn = get(conn, Routes.visit_log_path(conn, :show, visit_log))
      assert html_response(conn, 200) =~ "some updated bage"
    end

    test "renders errors when data is invalid", %{conn: conn, visit_log: visit_log} do
      conn = put(conn, Routes.visit_log_path(conn, :update, visit_log), visit_log: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Visit log"
    end
  end

  describe "delete visit_log" do
    setup [:create_visit_log]

    test "deletes chosen visit_log", %{conn: conn, visit_log: visit_log} do
      conn = delete(conn, Routes.visit_log_path(conn, :delete, visit_log))
      assert redirected_to(conn) == Routes.visit_log_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.visit_log_path(conn, :show, visit_log))
      end
    end
  end

  defp create_visit_log(_) do
    visit_log = fixture(:visit_log)
    {:ok, visit_log: visit_log}
  end
end
