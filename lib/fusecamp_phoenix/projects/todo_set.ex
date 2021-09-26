defmodule FusecampPhoenix.Projects.TodoSet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todo_sets" do
    field :description, :string
    field :name, :string
    belongs_to :project, FusecampPhoenix.Projects.Project

    timestamps()
  end

  @doc false
  def changeset(todo_set, attrs) do
    todo_set
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
