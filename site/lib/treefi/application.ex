defmodule Treefi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TreefiWeb.Telemetry,
      Treefi.Repo,
      {Ecto.Migrator,
        repos: Application.fetch_env!(:treefi, :ecto_repos),
        skip: skip_migrations?()},
      {DNSCluster, query: Application.get_env(:treefi, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Treefi.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Treefi.Finch},
      # Start a worker by calling: Treefi.Worker.start_link(arg)
      # {Treefi.Worker, arg},
      # Start to serve requests, typically the last entry
      TreefiWeb.Endpoint,
     {Beacon, sites: [[site: :treefi, endpoint: TreefiWeb.Endpoint, data_source: Treefi.BeaconDataSource]]}
]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Treefi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TreefiWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp skip_migrations?() do
    # By default, sqlite migrations are run when using a release
    System.get_env("RELEASE_NAME") != nil
  end
end
