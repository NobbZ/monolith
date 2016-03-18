# Monolith

`monolith` is going to become a static website generator which is aimed to
fullfil the following:

* Easy to extend via plugins
* Easy to configure
* It does know how to deploy (at least to most important targets)

## Installation

`monolith` is currently not available on [hex.pm][hex], therefore you have to
install it as follows:

1. Add monolith to your list of dependencies in `mix.exs`:

```ex
def deps do
  [{:monolith, github: "NobbZ/monolith", branch: "master"}]
end
```

2. Ensure monolith is started before your application:

```ex
def application do
  [applications: [:monolith]]
end
```

3. Pull and compile the newly added dependencies: `mix do deps.get, deps.compile`

## Projects using `monolith`

None I'm aware of so far.

[hex]: https://hex.pm/
