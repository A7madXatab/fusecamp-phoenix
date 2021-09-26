defmodule FusecampPhoenixWeb.ProjectView do
  use FusecampPhoenixWeb, :view

  def format_inserted_at(project) do
    date = "#{project.inserted_at.year}-#{project.inserted_at.month}-#{project.inserted_at.day}"
  end
end
