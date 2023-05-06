defmodule HumanResources.Repo do
  use Ecto.Repo,
    otp_app: :human_resources,
    adapter: Ecto.Adapters.Postgres
end
