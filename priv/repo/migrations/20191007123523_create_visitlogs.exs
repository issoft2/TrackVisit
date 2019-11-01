defmodule TrackVisit.Repo.Migrations.CreateVisitlogs do
  use Ecto.Migration

  def change do
    create table(:visitlogs) do
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :check_in_time, :naive_datetime
      add :check_out_time, :naive_datetime
      add :visit_reason, :string
      add :visitor_pix, :string
      add :bage, :string
      add :visitor, references(:visitors, on_delete: :nothing)
      add :who_to_see, references(:staffs, on_delete: :nothing)
      add :created_by, references(:staffs, on_delete: :nothing)

      timestamps()
    end

    create index(:visitlogs, [:visitor])
    create index(:visitlogs, [:who_to_see])
    create index(:visitlogs, [:created_by])
  end
end
