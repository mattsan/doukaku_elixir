defmodule Mix.Tasks.Doukaku.Test do
  use Mix.Task

  @shortdoc "doukaku test runner"

  def run(_) do
    app_name = Keyword.get(Mix.Project.config, :app)
    module_name = String.capitalize(Atom.to_string(app_name))

    Code.load_file("lib/#{app_name}/solver.exs")
    Code.load_file("lib/#{app_name}/test_runner.exs")

    String.to_atom("Elixir.#{module_name}.TestRunner").run()
  end
end
