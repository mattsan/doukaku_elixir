defmodule Doukaku.TestRunner do
  def judge(_, expected, expected) do
    IO.puts "\x1b[32mpassed\x1b[0m"
  end

  def judge(input, expected, actual) do
    IO.puts "\x1b[31mfailed  input: #{input}, expected: #{expected}, actual: #{actual}\x1b[0m"
  end

  defmacro __using__(_) do
    quote do
      import Doukaku.TestRunner
      @tests []
      @before_compile Doukaku.TestRunner
    end
  end

  defmacro solver(solver_function) do
    quote do
      @solver_function unquote(solver_function)
    end
  end

  defmacro test(input, expected) do
    quote do
      @tests [{unquote(input), unquote(expected)}|@tests]
    end
  end

  defmacro __before_compile__(_) do
    quote do
      def run do
        @tests
        |> Enum.reverse()
        |> Enum.each(fn {input, expected} -> judge(input, expected, @solver_function.(input)) end)
      end
    end
  end
end
