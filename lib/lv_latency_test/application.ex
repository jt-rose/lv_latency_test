defmodule LvLatencyTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LvLatencyTestWeb.Telemetry,
      # Start the Ecto repository
      LvLatencyTest.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LvLatencyTest.PubSub},
      # Start the Endpoint (http/https)
      LvLatencyTestWeb.Endpoint
      # Start a worker by calling: LvLatencyTest.Worker.start_link(arg)
      # {LvLatencyTest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LvLatencyTest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LvLatencyTestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
