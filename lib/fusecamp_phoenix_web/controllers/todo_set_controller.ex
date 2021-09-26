defmodule FusecampPhoenixWeb.TodoSetController do
  use FusecampPhoenixWeb, :controller

  alias FusecampPhoenix.Projects
  alias FusecampPhoenix.Projects.TodoSet

  def index(conn, _params) do
    todo_sets = Projects.list_todo_sets()
    render(conn, "index.html", todo_sets: todo_sets)
  end

  def new(conn, _params) do
    changeset = Projects.change_todo_set(%TodoSet{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"todo_set" => todo_set_params}) do
    case Projects.create_todo_set(todo_set_params) do
      {:ok, todo_set} ->
        conn
        |> put_flash(:info, "Todo set created successfully.")
        |> redirect(to: Routes.todo_set_path(conn, :show, todo_set))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_set = Projects.get_todo_set!(id)
    render(conn, "show.html", todo_set: todo_set)
  end

  def edit(conn, %{"id" => id}) do
    todo_set = Projects.get_todo_set!(id)
    changeset = Projects.change_todo_set(todo_set)
    render(conn, "edit.html", todo_set: todo_set, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo_set" => todo_set_params}) do
    todo_set = Projects.get_todo_set!(id)

    case Projects.update_todo_set(todo_set, todo_set_params) do
      {:ok, todo_set} ->
        conn
        |> put_flash(:info, "Todo set updated successfully.")
        |> redirect(to: Routes.todo_set_path(conn, :show, todo_set))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", todo_set: todo_set, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_set = Projects.get_todo_set!(id)
    {:ok, _todo_set} = Projects.delete_todo_set(todo_set)

    conn
    |> put_flash(:info, "Todo set deleted successfully.")
    |> redirect(to: Routes.todo_set_path(conn, :index))
  end
end
