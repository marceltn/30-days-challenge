defmodule App.Challenges.Info do
  use Ecto.Schema
  import Ecto.Changeset

  schema "infos" do
    field :name, :string
    field :start_date, :date

    timestamps()
  end

  @doc false
  def changeset(info, attrs) do
    info
    |> cast(attrs, [:name, :start_date])
    |> validate_required([:name, :start_date])
  end
end
