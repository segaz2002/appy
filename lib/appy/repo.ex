defmodule Appy.Repo do
  use Ecto.Repo,
    otp_app: :appy,
    adapter: Ecto.Adapters.Postgres
end
