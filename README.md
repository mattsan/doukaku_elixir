# Doukaku Tools for Elixir

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `doukaku` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:doukaku, git: "https://github.com/mattsan/doukaku_elixir"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/doukaku](https://hexdocs.pm/doukaku).

## Test Runner

### Generate template

Generate template of solver and test runner.

```sh
$ mix doukaku.new
```

```
└── lib
     ├── koukaita
     │   ├── solver.exs
     │   └── test_runner.exs
     └── koukaita.ex
```

#### Generated files

```elixir
defmodule Koukaita.Solver do
  def solve(input) do
    input
  end
end
```

```elixir
defmodule Koukaita.TestRunner do
  use Doukaku.TestRunner

  solver &Koukaita.Solver.solve/1

  test("abc", "abc")
end
```

#### Edit files

For example...

```elixir
defmodule Koukaita.Solver do
  def solve(_input) do
    "abc"
  end
end
```

```elixir
defmodule Koukaita.TestRunner do
  use Doukaku.TestRunner

  solver &Koukaita.Solver.solve/1

  test("abc", "abc")
  test("ABC", "ABC")
end
```

### Run test

```sh
$ mix doukaku.test
```
