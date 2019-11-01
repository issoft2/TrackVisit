defmodule TrackVisitWeb.CompanyControllerTest do
  use TrackVisitWeb.ConnCase

  alias TrackVisit.Subscriber

  @create_attrs %{biz_address: "some biz_address", city: "some city", crn: "some crn", email: "some email", logo: "some logo", mailing_address: "some mailing_address", name: "some name", phone: "some phone", type: "some type", website: "some website", zip_code: "some zip_code"}
  @update_attrs %{biz_address: "some updated biz_address", city: "some updated city", crn: "some updated crn", email: "some updated email", logo: "some updated logo", mailing_address: "some updated mailing_address", name: "some updated name", phone: "some updated phone", type: "some updated type", website: "some updated website", zip_code: "some updated zip_code"}
  @invalid_attrs %{biz_address: nil, city: nil, crn: nil, email: nil, logo: nil, mailing_address: nil, name: nil, phone: nil, type: nil, website: nil, zip_code: nil}

  def fixture(:company) do
    {:ok, company} = Subscriber.create_company(@create_attrs)
    company
  end

  describe "index" do
    test "lists all companies", %{conn: conn} do
      conn = get(conn, Routes.company_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Companies"
    end
  end

  describe "new company" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.company_path(conn, :new))
      assert html_response(conn, 200) =~ "New Company"
    end
  end

  describe "create company" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.company_path(conn, :show, id)

      conn = get(conn, Routes.company_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Company"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Company"
    end
  end

  describe "edit company" do
    setup [:create_company]

    test "renders form for editing chosen company", %{conn: conn, company: company} do
      conn = get(conn, Routes.company_path(conn, :edit, company))
      assert html_response(conn, 200) =~ "Edit Company"
    end
  end

  describe "update company" do
    setup [:create_company]

    test "redirects when data is valid", %{conn: conn, company: company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @update_attrs)
      assert redirected_to(conn) == Routes.company_path(conn, :show, company)

      conn = get(conn, Routes.company_path(conn, :show, company))
      assert html_response(conn, 200) =~ "some updated biz_address"
    end

    test "renders errors when data is invalid", %{conn: conn, company: company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Company"
    end
  end

  describe "delete company" do
    setup [:create_company]

    test "deletes chosen company", %{conn: conn, company: company} do
      conn = delete(conn, Routes.company_path(conn, :delete, company))
      assert redirected_to(conn) == Routes.company_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.company_path(conn, :show, company))
      end
    end
  end

  defp create_company(_) do
    company = fixture(:company)
    {:ok, company: company}
  end
end
