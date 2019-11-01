defmodule TrackVisit.Subscriber.Visitor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visitors" do
    field :address, :string
    field :badge, :string
    field :city, :string
    field :country, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :picture, :string
    field :uid, :string
    field :company, :id
    field :title, :string
    field :created_by, :id

    timestamps()
  end

  @doc false
  def changeset(visitor, attrs) do
    visitor
    |> cast(attrs, [:title, :first_name, :last_name, :phone, :email, :address, :uid, :badge, :country, :city, :picture])
    |> validate_required([:title, :first_name, :last_name, :phone, :email, :address, :uid, :badge, :country, :city])
  end
end
