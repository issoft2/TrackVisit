defmodule TrackVisitWeb.TitleController do
  use TrackVisitWeb, :controller

  alias TrackVisit.Subscriber
  alias TrackVisit.Subscriber.Title

  def index(conn, _params) do
    titles = Subscriber.list_titles()
    render(conn, "index.html", titles: titles)
  end

  def new(conn, _params) do
    changeset = Subscriber.change_title(%Title{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"title" => title_params}) do
    case Subscriber.create_title(title_params) do
      {:ok, title} ->
        conn
        |> put_flash(:info, "Title created successfully.")
        |> redirect(to: Routes.title_path(conn, :show, title))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    title = Subscriber.get_title!(id)
    render(conn, "show.html", title: title)
  end

  def edit(conn, %{"id" => id}) do
    title = Subscriber.get_title!(id)
    changeset = Subscriber.change_title(title)
    render(conn, "edit.html", title: title, changeset: changeset)
  end

  def update(conn, %{"id" => id, "title" => title_params}) do
    title = Subscriber.get_title!(id)

    case Subscriber.update_title(title, title_params) do
      {:ok, title} ->
        conn
        |> put_flash(:info, "Title updated successfully.")
        |> redirect(to: Routes.title_path(conn, :show, title))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", title: title, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    title = Subscriber.get_title!(id)
    {:ok, _title} = Subscriber.delete_title(title)

    conn
    |> put_flash(:info, "Title deleted successfully.")
    |> redirect(to: Routes.title_path(conn, :index))
  end
end
