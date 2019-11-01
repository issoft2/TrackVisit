defmodule TrackVisit.Repo.Migrations.CreateVisitors do
  use Ecto.Migration

  def change do
    create table(:visitors) do
      add :first_name, :string
      add :last_name, :string
      add :phone, :string
      add :email, :string
      add :address, :text
      add :uid, :string
      add :badge, :string
      add :country, :string
      add :city, :string
      add :picture, :string
      add :company, references(:companies, on_delete: :nothing)
      add :title, :string
      add :created_by, references(:staffs, on_delete: :nothing)

      timestamps()
    end

    create index(:visitors, [:company])
    create index(:visitors, [:created_by])
  end
end
