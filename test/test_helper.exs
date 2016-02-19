ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Wavelength.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Wavelength.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Wavelength.Repo)

