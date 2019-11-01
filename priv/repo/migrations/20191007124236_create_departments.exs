defmodule TrackVisit.Repo.Migrations.CreateDepartments do
  use Ecto.Migration

  def change do
    create table(:departments) do
      add :name, :string
      add :company, references(:companies, on_delete: :nothing)

      timestamps()
    end

    create index(:departments, [:company])
  end
end
