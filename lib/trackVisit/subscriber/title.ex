defmodule TrackVisit.Subscriber.Title do
  use Ecto.Schema
  import Ecto.Changeset

  schema "titles" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(title, attrs) do
    title
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
