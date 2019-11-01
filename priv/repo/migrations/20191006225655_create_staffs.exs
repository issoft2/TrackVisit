defmodule TrackVisit.Repo.Migrations.CreateStaffs do
  use Ecto.Migration

  def change do
    create table(:staffs) do
      add :first_name, :string
      add :last_name, :string
      add :phone, :string
      add :email, :string
      add :security_id, :string
      add :city_state_residence, :string
      add :country_residence, :string
      add :city_state_origin, :string
      add :country_origin, :string
      add :residence_address, :string
      add :next_kin_name, :string
      add :next_phone, :string
      add :relationship, :string
      add :user?, :boolean, default: false, null: false
      add :active?, :boolean, default: false, null: false
      add :deactivated_by, :integer
      add :company_id, references(:companies, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:staffs, [:phone])
    create unique_index(:staffs, [:email])
    create unique_index(:staffs, [:security_id])
    create index(:staffs, [:company_id])
  end
end
