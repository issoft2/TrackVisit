defmodule TrackVisit.SubscriberTest do
  use TrackVisit.DataCase

  alias TrackVisit.Subscriber

  describe "companies" do
    alias TrackVisit.Subscriber.Company

    @valid_attrs %{biz_address: "some biz_address", city: "some city", crn: "some crn", email: "some email", logo: "some logo", mailing_address: "some mailing_address", name: "some name", phone: "some phone", type: "some type", website: "some website", zip_code: "some zip_code"}
    @update_attrs %{biz_address: "some updated biz_address", city: "some updated city", crn: "some updated crn", email: "some updated email", logo: "some updated logo", mailing_address: "some updated mailing_address", name: "some updated name", phone: "some updated phone", type: "some updated type", website: "some updated website", zip_code: "some updated zip_code"}
    @invalid_attrs %{biz_address: nil, city: nil, crn: nil, email: nil, logo: nil, mailing_address: nil, name: nil, phone: nil, type: nil, website: nil, zip_code: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subscriber.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Subscriber.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Subscriber.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Subscriber.create_company(@valid_attrs)
      assert company.biz_address == "some biz_address"
      assert company.city == "some city"
      assert company.crn == "some crn"
      assert company.email == "some email"
      assert company.logo == "some logo"
      assert company.mailing_address == "some mailing_address"
      assert company.name == "some name"
      assert company.phone == "some phone"
      assert company.type == "some type"
      assert company.website == "some website"
      assert company.zip_code == "some zip_code"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscriber.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, %Company{} = company} = Subscriber.update_company(company, @update_attrs)
      assert company.biz_address == "some updated biz_address"
      assert company.city == "some updated city"
      assert company.crn == "some updated crn"
      assert company.email == "some updated email"
      assert company.logo == "some updated logo"
      assert company.mailing_address == "some updated mailing_address"
      assert company.name == "some updated name"
      assert company.phone == "some updated phone"
      assert company.type == "some updated type"
      assert company.website == "some updated website"
      assert company.zip_code == "some updated zip_code"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscriber.update_company(company, @invalid_attrs)
      assert company == Subscriber.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Subscriber.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Subscriber.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Subscriber.change_company(company)
    end
  end

  describe "staffs" do
    alias TrackVisit.Subscriber.Staff

    @valid_attrs %{active?: true, city_state_origin: "some city_state_origin", city_state_residence: "some city_state_residence", country_origin: "some country_origin", country_residence: "some country_residence", deactivated_by: 42, email: "some email", first_name: "some first_name", last_name: "some last_name", next_kin_name: "some next_kin_name", next_phone: "some next_phone", phone: "some phone", relationship: "some relationship", residence_address: "some residence_address", security_id: "some security_id", user?: true}
    @update_attrs %{active?: false, city_state_origin: "some updated city_state_origin", city_state_residence: "some updated city_state_residence", country_origin: "some updated country_origin", country_residence: "some updated country_residence", deactivated_by: 43, email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", next_kin_name: "some updated next_kin_name", next_phone: "some updated next_phone", phone: "some updated phone", relationship: "some updated relationship", residence_address: "some updated residence_address", security_id: "some updated security_id", user?: false}
    @invalid_attrs %{active?: nil, city_state_origin: nil, city_state_residence: nil, country_origin: nil, country_residence: nil, deactivated_by: nil, email: nil, first_name: nil, last_name: nil, next_kin_name: nil, next_phone: nil, phone: nil, relationship: nil, residence_address: nil, security_id: nil, user?: nil}

    def staff_fixture(attrs \\ %{}) do
      {:ok, staff} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subscriber.create_staff()

      staff
    end

    test "list_staffs/0 returns all staffs" do
      staff = staff_fixture()
      assert Subscriber.list_staffs() == [staff]
    end

    test "get_staff!/1 returns the staff with given id" do
      staff = staff_fixture()
      assert Subscriber.get_staff!(staff.id) == staff
    end

    test "create_staff/1 with valid data creates a staff" do
      assert {:ok, %Staff{} = staff} = Subscriber.create_staff(@valid_attrs)
      assert staff.active? == true
      assert staff.city_state_origin == "some city_state_origin"
      assert staff.city_state_residence == "some city_state_residence"
      assert staff.country_origin == "some country_origin"
      assert staff.country_residence == "some country_residence"
      assert staff.deactivated_by == 42
      assert staff.email == "some email"
      assert staff.first_name == "some first_name"
      assert staff.last_name == "some last_name"
      assert staff.next_kin_name == "some next_kin_name"
      assert staff.next_phone == "some next_phone"
      assert staff.phone == "some phone"
      assert staff.relationship == "some relationship"
      assert staff.residence_address == "some residence_address"
      assert staff.security_id == "some security_id"
      assert staff.user? == true
    end

    test "create_staff/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscriber.create_staff(@invalid_attrs)
    end

    test "update_staff/2 with valid data updates the staff" do
      staff = staff_fixture()
      assert {:ok, %Staff{} = staff} = Subscriber.update_staff(staff, @update_attrs)
      assert staff.active? == false
      assert staff.city_state_origin == "some updated city_state_origin"
      assert staff.city_state_residence == "some updated city_state_residence"
      assert staff.country_origin == "some updated country_origin"
      assert staff.country_residence == "some updated country_residence"
      assert staff.deactivated_by == 43
      assert staff.email == "some updated email"
      assert staff.first_name == "some updated first_name"
      assert staff.last_name == "some updated last_name"
      assert staff.next_kin_name == "some updated next_kin_name"
      assert staff.next_phone == "some updated next_phone"
      assert staff.phone == "some updated phone"
      assert staff.relationship == "some updated relationship"
      assert staff.residence_address == "some updated residence_address"
      assert staff.security_id == "some updated security_id"
      assert staff.user? == false
    end

    test "update_staff/2 with invalid data returns error changeset" do
      staff = staff_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscriber.update_staff(staff, @invalid_attrs)
      assert staff == Subscriber.get_staff!(staff.id)
    end

    test "delete_staff/1 deletes the staff" do
      staff = staff_fixture()
      assert {:ok, %Staff{}} = Subscriber.delete_staff(staff)
      assert_raise Ecto.NoResultsError, fn -> Subscriber.get_staff!(staff.id) end
    end

    test "change_staff/1 returns a staff changeset" do
      staff = staff_fixture()
      assert %Ecto.Changeset{} = Subscriber.change_staff(staff)
    end
  end

  describe "visitors" do
    alias TrackVisit.Subscriber.Visitor

    @valid_attrs %{address: "some address", badge: "some badge", city: "some city", country: "some country", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: "some phone", uid: "some uid"}
    @update_attrs %{address: "some updated address", badge: "some updated badge", city: "some updated city", country: "some updated country", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone", uid: "some updated uid"}
    @invalid_attrs %{address: nil, badge: nil, city: nil, country: nil, email: nil, first_name: nil, last_name: nil, phone: nil, uid: nil}

    def visitor_fixture(attrs \\ %{}) do
      {:ok, visitor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subscriber.create_visitor()

      visitor
    end

    test "list_visitors/0 returns all visitors" do
      visitor = visitor_fixture()
      assert Subscriber.list_visitors() == [visitor]
    end

    test "get_visitor!/1 returns the visitor with given id" do
      visitor = visitor_fixture()
      assert Subscriber.get_visitor!(visitor.id) == visitor
    end

    test "create_visitor/1 with valid data creates a visitor" do
      assert {:ok, %Visitor{} = visitor} = Subscriber.create_visitor(@valid_attrs)
      assert visitor.address == "some address"
      assert visitor.badge == "some badge"
      assert visitor.city == "some city"
      assert visitor.country == "some country"
      assert visitor.email == "some email"
      assert visitor.first_name == "some first_name"
      assert visitor.last_name == "some last_name"
      assert visitor.phone == "some phone"
      assert visitor.uid == "some uid"
    end

    test "create_visitor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscriber.create_visitor(@invalid_attrs)
    end

    test "update_visitor/2 with valid data updates the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{} = visitor} = Subscriber.update_visitor(visitor, @update_attrs)
      assert visitor.address == "some updated address"
      assert visitor.badge == "some updated badge"
      assert visitor.city == "some updated city"
      assert visitor.country == "some updated country"
      assert visitor.email == "some updated email"
      assert visitor.first_name == "some updated first_name"
      assert visitor.last_name == "some updated last_name"
      assert visitor.phone == "some updated phone"
      assert visitor.uid == "some updated uid"
    end

    test "update_visitor/2 with invalid data returns error changeset" do
      visitor = visitor_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscriber.update_visitor(visitor, @invalid_attrs)
      assert visitor == Subscriber.get_visitor!(visitor.id)
    end

    test "delete_visitor/1 deletes the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{}} = Subscriber.delete_visitor(visitor)
      assert_raise Ecto.NoResultsError, fn -> Subscriber.get_visitor!(visitor.id) end
    end

    test "change_visitor/1 returns a visitor changeset" do
      visitor = visitor_fixture()
      assert %Ecto.Changeset{} = Subscriber.change_visitor(visitor)
    end
  end

  describe "titles" do
    alias TrackVisit.Subscriber.Title

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def title_fixture(attrs \\ %{}) do
      {:ok, title} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subscriber.create_title()

      title
    end

    test "list_titles/0 returns all titles" do
      title = title_fixture()
      assert Subscriber.list_titles() == [title]
    end

    test "get_title!/1 returns the title with given id" do
      title = title_fixture()
      assert Subscriber.get_title!(title.id) == title
    end

    test "create_title/1 with valid data creates a title" do
      assert {:ok, %Title{} = title} = Subscriber.create_title(@valid_attrs)
      assert title.name == "some name"
    end

    test "create_title/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscriber.create_title(@invalid_attrs)
    end

    test "update_title/2 with valid data updates the title" do
      title = title_fixture()
      assert {:ok, %Title{} = title} = Subscriber.update_title(title, @update_attrs)
      assert title.name == "some updated name"
    end

    test "update_title/2 with invalid data returns error changeset" do
      title = title_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscriber.update_title(title, @invalid_attrs)
      assert title == Subscriber.get_title!(title.id)
    end

    test "delete_title/1 deletes the title" do
      title = title_fixture()
      assert {:ok, %Title{}} = Subscriber.delete_title(title)
      assert_raise Ecto.NoResultsError, fn -> Subscriber.get_title!(title.id) end
    end

    test "change_title/1 returns a title changeset" do
      title = title_fixture()
      assert %Ecto.Changeset{} = Subscriber.change_title(title)
    end
  end

  describe "visitors" do
    alias TrackVisit.Subscriber.Visitor

    @valid_attrs %{address: "some address", badge: "some badge", city: "some city", country: "some country", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: "some phone", picture: "some picture", uid: "some uid"}
    @update_attrs %{address: "some updated address", badge: "some updated badge", city: "some updated city", country: "some updated country", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: "some updated phone", picture: "some updated picture", uid: "some updated uid"}
    @invalid_attrs %{address: nil, badge: nil, city: nil, country: nil, email: nil, first_name: nil, last_name: nil, phone: nil, picture: nil, uid: nil}

    def visitor_fixture(attrs \\ %{}) do
      {:ok, visitor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subscriber.create_visitor()

      visitor
    end

    test "list_visitors/0 returns all visitors" do
      visitor = visitor_fixture()
      assert Subscriber.list_visitors() == [visitor]
    end

    test "get_visitor!/1 returns the visitor with given id" do
      visitor = visitor_fixture()
      assert Subscriber.get_visitor!(visitor.id) == visitor
    end

    test "create_visitor/1 with valid data creates a visitor" do
      assert {:ok, %Visitor{} = visitor} = Subscriber.create_visitor(@valid_attrs)
      assert visitor.address == "some address"
      assert visitor.badge == "some badge"
      assert visitor.city == "some city"
      assert visitor.country == "some country"
      assert visitor.email == "some email"
      assert visitor.first_name == "some first_name"
      assert visitor.last_name == "some last_name"
      assert visitor.phone == "some phone"
      assert visitor.picture == "some picture"
      assert visitor.uid == "some uid"
    end

    test "create_visitor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscriber.create_visitor(@invalid_attrs)
    end

    test "update_visitor/2 with valid data updates the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{} = visitor} = Subscriber.update_visitor(visitor, @update_attrs)
      assert visitor.address == "some updated address"
      assert visitor.badge == "some updated badge"
      assert visitor.city == "some updated city"
      assert visitor.country == "some updated country"
      assert visitor.email == "some updated email"
      assert visitor.first_name == "some updated first_name"
      assert visitor.last_name == "some updated last_name"
      assert visitor.phone == "some updated phone"
      assert visitor.picture == "some updated picture"
      assert visitor.uid == "some updated uid"
    end

    test "update_visitor/2 with invalid data returns error changeset" do
      visitor = visitor_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscriber.update_visitor(visitor, @invalid_attrs)
      assert visitor == Subscriber.get_visitor!(visitor.id)
    end

    test "delete_visitor/1 deletes the visitor" do
      visitor = visitor_fixture()
      assert {:ok, %Visitor{}} = Subscriber.delete_visitor(visitor)
      assert_raise Ecto.NoResultsError, fn -> Subscriber.get_visitor!(visitor.id) end
    end

    test "change_visitor/1 returns a visitor changeset" do
      visitor = visitor_fixture()
      assert %Ecto.Changeset{} = Subscriber.change_visitor(visitor)
    end
  end
end
