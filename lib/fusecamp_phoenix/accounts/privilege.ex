defmodule FusecampPhoenix.Accounts.Privilege do
  use Ecto.Schema
  import Ecto.Changeset

  schema "privileges" do
    field :user_id, :id
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(privilege, attrs) do
    privilege
    |> cast(attrs, [])
    |> validate_required([])
  end
end
