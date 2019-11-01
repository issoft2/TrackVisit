defmodule TrackVisitWeb.VisitorControllerTest do
  use TrackVisitWeb.ConnCase

  alias TrackVisit.Subscriber

  @create_attrs %{address: "some address", badge: "some badge", city: "some city", country: "some country", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: "some phone", picture: "some picture", uid: "some uid"}
  @update_attrs %{address: "some updated address", badge: "some updated badge", city: "some updated city", country: "some updated country", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone", picture: "some updated picture", uid: "some updated uid"}
  @invalid_attrs %{address: nil, badge: nil, city: nil, country: nil, email: nil, first_name: nil, last_name: nil, phone: nil, picture: nil, uid: nil}

  def fixture(:visitor) do
    {:ok, visitor} = Subscriber.create_visitor(@create_attrs)
    visitor
  end

  describe "index" do
    test "lists all visitors", %{conn: conn} do
      conn = get(conn, Routes.visitor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Visitors"
    end
  end

  describe "new visitor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.visitor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Visitor"
    end
  end

  describe "create visitor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.visitor_path(conn, :create), visitor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.visitor_path(conn, :show, id)

      conn = get(conn, Routes.visitor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Visitor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.visitor_path(conn, :create), visitor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Visitor"
    end
  end

  describe "edit visitor" do
    setup [:create_visitor]

    test "renders form for editing chosen visitor", %{conn: conn, visitor: visitor} do
      conn = get(conn, Routes.visitor_path(conn, :edit, visitor))
      assert html_response(conn, 200) =~ "Edit Visitor"
    end
  end

  describe "update visitor" do
    setup [:create_visitor]

    test "redirects when data is valid", %{conn: conn, visitor: visitor} do
      conn = put(conn, Routes.visitor_path(conn, :update, visitor), visitor: @update_attrs)
      assert redirected_to(conn) == Routes.visitor_path(conn, :show, visitor)

      conn = get(conn, Routes.visitor_path(conn, :show, visitor))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, visitor: visitor} do
      conn = put(conn, Routes.visitor_path(conn, :update, visitor), visitor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Visitor"
    end
  end

  describe "delete visitor" do
    setup [:create_visitor]

    test "deletes chosen visitor", %{conn: conn, visitor: visitor} do
      conn = delete(conn, Routes.visitor_path(conn, :delete, visitor))
      assert redirected_to(conn) == Routes.visitor_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.visitor_path(conn, :show, visitor))
      end
    end
  end

  defp create_visitor(_) do
    visitor = fixture(:visitor)
    {:ok, visitor: visitor}
  end
end
