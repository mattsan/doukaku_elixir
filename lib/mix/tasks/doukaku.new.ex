defmodule Mix.Tasks.Doukaku.New do
  use Mix.Task

  @shortdoc "generate doukaku template"

  def run(_) do
    app_name = Keyword.get(Mix.Project.config, :app)
    module_name = String.capitalize(Atom.to_string(app_name))

    Mix.Generator.create_file("lib/#{app_name}/test_runner.exs", """
    defmodule #{module_name}.TestRunner do
      use Doukaku.TestRunner

      solver &#{module_name}.Solver.solve/1

      test("abc", "abc")
    end
    """)

    Mix.Generator.create_file("lib/#{app_name}/solver.exs", """
    defmodule #{module_name}.Solver do
      def solve(input) do
        input
      end
    end
    """)
  end
end
