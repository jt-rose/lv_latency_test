defmodule LvLatencyTest.Repo do
  use Ecto.Repo,
    otp_app: :lv_latency_test,
    adapter: Ecto.Adapters.Postgres
end
