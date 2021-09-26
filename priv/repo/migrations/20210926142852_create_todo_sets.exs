defmodule FusecampPhoenix.Repo.Migrations.CreateTodoSets do
  use Ecto.Migration

  def change do
    create table(:todo_sets) do
      add :name, :string
      add :description, :text
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:todo_sets, [:project_id])
  end
end
