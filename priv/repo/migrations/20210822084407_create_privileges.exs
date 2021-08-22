defmodule FusecampPhoenix.Repo.Migrations.CreatePrivileges do
  use Ecto.Migration

  def change do
    create table(:privileges) do
      add :user_id, references(:users, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)
      add :role, :string

      timestamps()
    end

    create index(:privileges, [:user_id])
    create index(:privileges, [:project_id])
  end
end
