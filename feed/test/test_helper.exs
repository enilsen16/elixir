ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Feed.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Feed.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Feed.Repo)

