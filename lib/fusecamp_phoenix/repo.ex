defmodule FusecampPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :fusecamp_phoenix,
    adapter: Ecto.Adapters.Postgres
end
