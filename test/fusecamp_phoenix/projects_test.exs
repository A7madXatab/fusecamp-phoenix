defmodule FusecampPhoenix.ProjectsTest do
  use FusecampPhoenix.DataCase

  alias FusecampPhoenix.Projects

  describe "projects" do
    alias FusecampPhoenix.Projects.Project

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Projects.create_project(@valid_attrs)
      assert project.description == "some description"
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Projects.update_project(project, @update_attrs)
      assert project.description == "some updated description"
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "todo_sets" do
    alias FusecampPhoenix.Projects.TodoSet

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def todo_set_fixture(attrs \\ %{}) do
      {:ok, todo_set} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_todo_set()

      todo_set
    end

    test "list_todo_sets/0 returns all todo_sets" do
      todo_set = todo_set_fixture()
      assert Projects.list_todo_sets() == [todo_set]
    end

    test "get_todo_set!/1 returns the todo_set with given id" do
      todo_set = todo_set_fixture()
      assert Projects.get_todo_set!(todo_set.id) == todo_set
    end

    test "create_todo_set/1 with valid data creates a todo_set" do
      assert {:ok, %TodoSet{} = todo_set} = Projects.create_todo_set(@valid_attrs)
      assert todo_set.description == "some description"
      assert todo_set.name == "some name"
    end

    test "create_todo_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_todo_set(@invalid_attrs)
    end

    test "update_todo_set/2 with valid data updates the todo_set" do
      todo_set = todo_set_fixture()
      assert {:ok, %TodoSet{} = todo_set} = Projects.update_todo_set(todo_set, @update_attrs)
      assert todo_set.description == "some updated description"
      assert todo_set.name == "some updated name"
    end

    test "update_todo_set/2 with invalid data returns error changeset" do
      todo_set = todo_set_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_todo_set(todo_set, @invalid_attrs)
      assert todo_set == Projects.get_todo_set!(todo_set.id)
    end

    test "delete_todo_set/1 deletes the todo_set" do
      todo_set = todo_set_fixture()
      assert {:ok, %TodoSet{}} = Projects.delete_todo_set(todo_set)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_todo_set!(todo_set.id) end
    end

    test "change_todo_set/1 returns a todo_set changeset" do
      todo_set = todo_set_fixture()
      assert %Ecto.Changeset{} = Projects.change_todo_set(todo_set)
    end
  end
end
