defmodule TrackVisitWeb.Router do
  use TrackVisitWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TrackVisitWeb do
    pipe_through :browser

    resources "/", PageController
    resources "/module/company", CompanyController
    resources "/company/staffs", StaffController
    resources "/company/visitors", VisitorController
    resources "/company/staff/titles", TitleController
    resources "/company/visitlogs", VisitLogController
    resources "/company/departments", DepartmentController

  end

  # Other scopes may use custom stacks.
  # scope "/api", TrackVisitWeb do
  #   pipe_through :api
  # end
end
