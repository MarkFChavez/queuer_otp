# Queuer

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `queuer` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:queuer, "~> 0.1.0"}]
    end
    ```

  2. Ensure `queuer` is started before your application:

    ```elixir
    def application do
      [applications: [:queuer]]
    end
    ```


## Run tests

```ruby
mix test
```

All tests should pass. If there are failing test, please add an issue.
