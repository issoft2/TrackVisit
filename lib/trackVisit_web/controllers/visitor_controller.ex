defmodule TrackVisitWeb.VisitorController do
  use TrackVisitWeb, :controller

  alias TrackVisit.Subscriber
  alias TrackVisit.Subscriber.Visitor

  def index(conn, _params) do
    visitors = Subscriber.list_visitors()
    render(conn, "index.html", visitors: visitors)
  end

  def new(conn, _params) do
    changeset = Subscriber.change_visitor(%Visitor{})
    titles = Subscriber.list_titles()
    |> Enum.map(&{&1.name, &1.name})
    render(conn, "new.html", changeset: changeset, titles: titles)
  end

  def create(conn, %{"visitor" => visitor_params}) do
    case Subscriber.create_visitor(visitor_params) do
      {:ok, visitor} ->
        conn
        |> put_flash(:info, "Visitor created successfully.")
        |> redirect(to: Routes.visitor_path(conn, :show, visitor))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visitor = Subscriber.get_visitor!(id)
    render(conn, "show.html", visitor: visitor)
  end

  def edit(conn, %{"id" => id}) do
    visitor = Subscriber.get_visitor!(id)
    changeset = Subscriber.change_visitor(visitor)
    render(conn, "edit.html", visitor: visitor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visitor" => visitor_params}) do
    visitor = Subscriber.get_visitor!(id)

    case Subscriber.update_visitor(visitor, visitor_params) do
      {:ok, visitor} ->
        conn
        |> put_flash(:info, "Visitor updated successfully.")
        |> redirect(to: Routes.visitor_path(conn, :show, visitor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", visitor: visitor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visitor = Subscriber.get_visitor!(id)
    {:ok, _visitor} = Subscriber.delete_visitor(visitor)

    conn
    |> put_flash(:info, "Visitor deleted successfully.")
    |> redirect(to: Routes.visitor_path(conn, :index))
  end
end
