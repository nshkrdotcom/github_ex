Application.put_env(:github_sdk, :api_version, "2026-03-10")
Application.put_env(:github_sdk, :base_url, "https://api.github.com")
Application.put_env(:github_sdk, :oauth_site, "https://github.com")
Application.put_env(:github_sdk, :timeout_ms, 60_000)
Application.put_env(:github_sdk, :user_agent, "github-sdk-elixir/0.1.0")

Application.put_env(
  :github_sdk,
  :retry,
  max_retries: 2,
  initial_retry_delay_ms: 1_000,
  max_retry_delay_ms: 60_000
)

Logger.configure(level: :warning)

ExUnit.start(capture_log: true)
