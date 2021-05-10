# Itaco

**itaco is a wrapper that assists ecto**

## Installation

```elixir
def deps do
  [
    {:itaco, "~> 1.0.0"}
  ]
end
```

## usage

* pre requirements

```elixir
defmodule TestApp.User do
  use Itaco, schema: TestApp.User.Account, repo: TestApp.Repo
end
```

* You can do below!

```
User.find(1) # => SELECT * FROM accounts WHERE id = 1

User.all # => SELECT * FROM accounts

User.where(name: "hoge") # => SELECT * FROM accounts WHERE name = 'hoge'

User.create(name: "大阪しずく", email: "s.ohsaka@example.com")

User.updaate(user, name: "桜坂しずく")

User.delete(user)
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/itaco](https://hexdocs.pm/itaco).
