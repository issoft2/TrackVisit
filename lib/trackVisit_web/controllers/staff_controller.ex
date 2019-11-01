defmodule TrackVisitWeb.StaffController do
  use TrackVisitWeb, :controller

  alias TrackVisit.Subscriber
  alias TrackVisit.Subscriber.Staff

  def index(conn, _params) do
    staffs = Subscriber.list_staffs()
    render(conn, "index.html", staffs: staffs)
  end

  def new(conn, _params) do
    changeset = Subscriber.change_staff(%Staff{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"staff" => staff_params}) do
    case Subscriber.create_staff(staff_params) do
      {:ok, staff} ->
        conn
        |> put_flash(:info, "Staff created successfully.")
        |> redirect(to: Routes.staff_path(conn, :show, staff))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    staff = Subscriber.get_staff!(id)
    render(conn, "show.html", staff: staff)
  end

  def edit(conn, %{"id" => id}) do
    staff = Subscriber.get_staff!(id)
    changeset = Subscriber.change_staff(staff)
    render(conn, "edit.html", staff: staff, changeset: changeset)
  end

  def update(conn, %{"id" => id, "staff" => staff_params}) do
    staff = Subscriber.get_staff!(id)

    case Subscriber.update_staff(staff, staff_params) do
      {:ok, staff} ->
        conn
        |> put_flash(:info, "Staff updated successfully.")
        |> redirect(to: Routes.staff_path(conn, :show, staff))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", staff: staff, changeset: changeset)
    end
  end
end
