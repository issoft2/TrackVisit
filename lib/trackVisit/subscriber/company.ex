defmodule TrackVisit.Subscriber.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :biz_address, :string
    field :city, :string
    field :crn, :string
    field :email, :string
    field :logo, :string
    field :mailing_address, :string
    field :name, :string
    field :phone, :string
    field :type, :string
    field :website, :string
    field :zip_code, :string

    timestamps()
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :crn, :phone, :email, :biz_address, :mailing_address, :city, :type, :website,  :logo, :zip_code])
    |> validate_required([:name, :crn, :phone, :email, :biz_address, :mailing_address, :city, :type, :website,  :zip_code])
  end
end
