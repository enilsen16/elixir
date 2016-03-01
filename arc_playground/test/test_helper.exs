ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ArcPlayground.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ArcPlayground.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ArcPlayground.Repo)

