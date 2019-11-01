defmodule TrackVisitWeb.DepartmentController do
    use TrackVisitWeb, :controller

    alias TrackVisit.Company.Department
    alias TrackVisit.Company
    alias TrackVisit.Subscriber


    def index(conn, __params) do
        departments = Company.list_departments()
        render(conn, "index.html", departments: departments)
    end 

    def new(conn, _params) do
        changeset = Company.change_department(%Department{})
        companies =
         Subscriber.list_companies()
         |> Enum.map(&{&1.name <> " CRN:" <> &1.crn, &1.name})
        render(conn, "new.html", changeset: changeset, companies: companies)
    end 
    
    def create(conn, %{"department" => department_params}) do
        case Company.create_department(department_params) do
            {:ok, department} ->
                conn
                |> put_flash(:info, "Department created successfully.")
                |> redirect(to: Routes.department_path(conn, :show, department))

                {:error, %Ecto.Changeset{} = changeset} ->
                    render(conn, "new.html", changeset: changeset)
        end 
    end 

    def show(conn, %{"id" => id}) do
        department = Company.get_department!(id)
        render(conn, "show.html", department: department)
    end 

    def edit(conn, %{"id" => id}) do
        department = Company.get_department!(id)
        changeset = Company.change_department(department)
        companies =
         Subscriber.list_companies()
         |> Enum.map(&{&1.name <> " CRN:" <> &1.crn, &1.name})
        render(conn, "edit.html", department: department, changeset: changeset, companies: companies)
    end 

    def update(conn, %{"id" => id, "department" => department_params}) do
        department = Company.get_department!(id)
        case Company.update_department(department, department_params) do
            {:ok, department} ->
                conn
                |> put_flash(:info, "Department updated successfully.")
                |> redirect(to: Routes.department_path(conn, :show, department))

                {:error, %Ecto.Changeset{} = changeset} ->
                    render(conn, "edit.html", department: department, changeset: changeset)
                end

                end 
end