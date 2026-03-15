import Config

config :github_ex,
  api_version: "2026-03-10",
  base_url: "https://api.github.com",
  oauth_site: "https://github.com",
  timeout_ms: 60_000,
  user_agent: "github-ex-elixir/0.1.0"

config :github_ex, :retry,
  max_retries: 2,
  initial_retry_delay_ms: 1_000,
  max_retry_delay_ms: 60_000

import_config "#{config_env()}.exs"
