defmodule FusecampPhoenixWeb.TodoSetControllerTest do
  use FusecampPhoenixWeb.ConnCase

  alias FusecampPhoenix.Projects

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:todo_set) do
    {:ok, todo_set} = Projects.create_todo_set(@create_attrs)
    todo_set
  end

  describe "index" do
    test "lists all todo_sets", %{conn: conn} do
      conn = get(conn, Routes.todo_set_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Todo sets"
    end
  end

  describe "new todo_set" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.todo_set_path(conn, :new))
      assert html_response(conn, 200) =~ "New Todo set"
    end
  end

  describe "create todo_set" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.todo_set_path(conn, :create), todo_set: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.todo_set_path(conn, :show, id)

      conn = get(conn, Routes.todo_set_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Todo set"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.todo_set_path(conn, :create), todo_set: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Todo set"
    end
  end

  describe "edit todo_set" do
    setup [:create_todo_set]

    test "renders form for editing chosen todo_set", %{conn: conn, todo_set: todo_set} do
      conn = get(conn, Routes.todo_set_path(conn, :edit, todo_set))
      assert html_response(conn, 200) =~ "Edit Todo set"
    end
  end

  describe "update todo_set" do
    setup [:create_todo_set]

    test "redirects when data is valid", %{conn: conn, todo_set: todo_set} do
      conn = put(conn, Routes.todo_set_path(conn, :update, todo_set), todo_set: @update_attrs)
      assert redirected_to(conn) == Routes.todo_set_path(conn, :show, todo_set)

      conn = get(conn, Routes.todo_set_path(conn, :show, todo_set))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, todo_set: todo_set} do
      conn = put(conn, Routes.todo_set_path(conn, :update, todo_set), todo_set: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Todo set"
    end
  end

  describe "delete todo_set" do
    setup [:create_todo_set]

    test "deletes chosen todo_set", %{conn: conn, todo_set: todo_set} do
      conn = delete(conn, Routes.todo_set_path(conn, :delete, todo_set))
      assert redirected_to(conn) == Routes.todo_set_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.todo_set_path(conn, :show, todo_set))
      end
    end
  end

  defp create_todo_set(_) do
    todo_set = fixture(:todo_set)
    %{todo_set: todo_set}
  end
end
