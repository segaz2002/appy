defmodule Appy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Appy.Repo,
      # Start the Telemetry supervisor
      AppyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Appy.PubSub},
      # Start the Endpoint (http/https)
      AppyWeb.Endpoint
      # Start a worker by calling: Appy.Worker.start_link(arg)
      # {Appy.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Appy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AppyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
