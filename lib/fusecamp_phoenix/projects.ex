defmodule FusecampPhoenix.Projects do
  @moduledoc """
  The Projects context.
  """

  import Ecto.Query, warn: false
  alias FusecampPhoenix.Repo

  alias FusecampPhoenix.Projects.Project
  alias FusecampPhoenix.Accounts.Privilege

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  def create_privilege(user, project, attrs \\ %{}) do
    %Privilege{}
    |>Privilege.changeset(attrs)
    |>Ecto.Changeset.put_assoc(:user, user)
    |>Ecto.Changeset.put_assoc(:project, project)
    |>FusecampPhoenix.Repo.insert()
  end

  alias FusecampPhoenix.Projects.TodoSet

  @doc """
  Returns the list of todo_sets.

  ## Examples

      iex> list_todo_sets()
      [%TodoSet{}, ...]

  """
  def list_todo_sets do
    Repo.all(TodoSet)
  end

  @doc """
  Gets a single todo_set.

  Raises `Ecto.NoResultsError` if the Todo set does not exist.

  ## Examples

      iex> get_todo_set!(123)
      %TodoSet{}

      iex> get_todo_set!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo_set!(id), do: Repo.get!(TodoSet, id)

  @doc """
  Creates a todo_set.

  ## Examples

      iex> create_todo_set(%{field: value})
      {:ok, %TodoSet{}}

      iex> create_todo_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo_set(attrs \\ %{}) do
    %TodoSet{}
    |> TodoSet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo_set.

  ## Examples

      iex> update_todo_set(todo_set, %{field: new_value})
      {:ok, %TodoSet{}}

      iex> update_todo_set(todo_set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo_set(%TodoSet{} = todo_set, attrs) do
    todo_set
    |> TodoSet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a todo_set.

  ## Examples

      iex> delete_todo_set(todo_set)
      {:ok, %TodoSet{}}

      iex> delete_todo_set(todo_set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo_set(%TodoSet{} = todo_set) do
    Repo.delete(todo_set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo_set changes.

  ## Examples

      iex> change_todo_set(todo_set)
      %Ecto.Changeset{data: %TodoSet{}}

  """
  def change_todo_set(%TodoSet{} = todo_set, attrs \\ %{}) do
    TodoSet.changeset(todo_set, attrs)
  end
end
