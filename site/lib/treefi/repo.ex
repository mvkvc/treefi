defmodule Treefi.Repo do
  use Ecto.Repo,
    otp_app: :treefi,
    adapter: Ecto.Adapters.SQLite3
end
