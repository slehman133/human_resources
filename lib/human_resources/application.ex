defmodule HumanResources.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HumanResourcesWeb.Telemetry,
      # Start the Ecto repository
      HumanResources.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: HumanResources.PubSub},
      # Start Finch
      {Finch, name: HumanResources.Finch},
      # Start the Endpoint (http/https)
      HumanResourcesWeb.Endpoint
      # Start a worker by calling: HumanResources.Worker.start_link(arg)
      # {HumanResources.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HumanResources.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HumanResourcesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
