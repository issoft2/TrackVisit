defmodule TrackVisit.Repo do
  use Ecto.Repo,
    otp_app: :trackVisit,
    adapter: Ecto.Adapters.Postgres
end
