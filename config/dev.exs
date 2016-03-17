use Mix.Config

config :logger,
  backends: [:console],
  level: :debug,
  compile_time_purge_level: :debug

config :todo,
  print: :overdue,
  persist: true
