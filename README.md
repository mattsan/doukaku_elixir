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

### Example

```
├── lib
│   └── koukaita.ex
└── mix.exs
```

#### mix.exs

```elixir
defmodule Koukaita.MixFile do
  use Mix.Project

  def project do
    [
      app: :koukaita,
      version: "0.1.0",
      deps: deps()
    ]
  end

  def deps do
    [
      {:doukaku, git: "https://github.com/mattsan/doukaku_elixir"}
    ]
  end
end
```

#### lib/koukaita.ex

```elixir
defmodule Koukaita do
  def solve(_input) do
    "abc"
  end

  defmodule TestRunner do
    use Doukaku.TestRunner

    solver(&Koukaita.solve/1)

    test("abc", "abc")
    test("ABC", "ABC")
  end
end
```

#### run

```sh
$ mix deps.get
$ mix run -e 'Koukaita.TestRunner.run'
```

