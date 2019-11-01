defmodule TrackVisit.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :crn, :string
      add :phone, :string
      add :email, :string
      add :biz_address, :text
      add :mailing_address, :text
      add :city, :string
      add :type, :string
      add :website, :string
      add :logo, :string
      add :zip_code, :string

      timestamps()
    end

  end
end
