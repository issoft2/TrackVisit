defmodule TrackVisit.Repo.Migrations.CreateTitles do
  use Ecto.Migration

  def change do
    create table(:titles) do
      add :name, :string

      timestamps()
    end

  end
end
