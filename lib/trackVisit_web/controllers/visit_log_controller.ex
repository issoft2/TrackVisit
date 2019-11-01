defmodule TrackVisitWeb.VisitLogController do
  use TrackVisitWeb, :controller

  alias TrackVisit.Company
  alias TrackVisit.Company.VisitLog

  def index(conn, _params) do
    visitlogs = Company.list_visitlogs()
    render(conn, "index.html", visitlogs: visitlogs)
  end

  def new(conn, _params) do
    changeset = Company.change_visit_log(%VisitLog{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"visit_log" => visit_log_params}) do
    case Company.create_visit_log(visit_log_params) do
      {:ok, visit_log} ->
        conn
        |> put_flash(:info, "Visit log created successfully.")
        |> redirect(to: Routes.visit_log_path(conn, :show, visit_log))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visit_log = Company.get_visit_log!(id)
    render(conn, "show.html", visit_log: visit_log)
  end

  def edit(conn, %{"id" => id}) do
    visit_log = Company.get_visit_log!(id)
    changeset = Company.change_visit_log(visit_log)
    render(conn, "edit.html", visit_log: visit_log, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visit_log" => visit_log_params}) do
    visit_log = Company.get_visit_log!(id)

    case Company.update_visit_log(visit_log, visit_log_params) do
      {:ok, visit_log} ->
        conn
        |> put_flash(:info, "Visit log updated successfully.")
        |> redirect(to: Routes.visit_log_path(conn, :show, visit_log))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", visit_log: visit_log, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visit_log = Company.get_visit_log!(id)
    {:ok, _visit_log} = Company.delete_visit_log(visit_log)

    conn
    |> put_flash(:info, "Visit log deleted successfully.")
    |> redirect(to: Routes.visit_log_path(conn, :index))
  end
end
