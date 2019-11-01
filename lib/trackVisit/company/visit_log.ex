defmodule TrackVisit.Company.VisitLog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visitlogs" do
    field :bage, :string
    field :check_in_time, :naive_datetime
    field :check_out_time, :naive_datetime
    field :end_time, :naive_datetime
    field :start_time, :naive_datetime
    field :visit_reason, :string
    field :visitor_pix, :string
    field :visitor, :id
    field :who_to_see, :id
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(visit_log, attrs) do
    visit_log
    |> cast(attrs, [:start_time, :end_time, :check_in_time, :check_out_time, :visit_reason, :visitor_pix, :bage])
    |> validate_required([:start_time, :end_time, :check_in_time, :check_out_time, :visit_reason, :visitor_pix, :bage])
  end
end
