defmodule TrackVisit.Subscriber.Staff do
  use Ecto.Schema
  import Ecto.Changeset

  schema "staffs" do
    field :active?, :boolean, default: false
    field :city_state_origin, :string
    field :city_state_residence, :string
    field :country_origin, :string
    field :country_residence, :string
    field :deactivated_by, :integer
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :next_kin_name, :string
    field :next_phone, :string
    field :phone, :string
    field :relationship, :string
    field :residence_address, :string
    field :security_id, :string
    field :user?, :boolean, default: false
    field :company_id, :id

    timestamps()
  end

  @doc false
  def changeset(staff, attrs) do
    staff
    |> cast(attrs, [:first_name, :last_name, :phone, :email, :security_id, :city_state_residence, :country_residence, :city_state_origin, :country_origin, :residence_address, :next_kin_name, :next_phone, :relationship, :user?, :active?])
    |> validate_required([:first_name, :last_name, :phone, :email, :security_id, :city_state_residence, :country_residence, :city_state_origin, :country_origin, :residence_address, :next_kin_name, :next_phone, :relationship, :user?, :active?])
    |> unique_constraint(:phone)
    |> unique_constraint(:email)
    |> unique_constraint(:security_id)
  end
end
