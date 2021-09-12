defmodule FusecampPhoenix.Accounts.Privilege do
  use Ecto.Schema
  import Ecto.Changeset

  schema "privileges" do
    belongs_to :user, FusecampPhoenix.Accounts.User
    belongs_to :project, FusecampPhoenix.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(privilege, attrs) do
    privilege
    |> cast(attrs, [])
    |> validate_required([])
  end
end
