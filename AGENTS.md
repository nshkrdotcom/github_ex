# Repository Guidelines

## Project Structure
- `lib/` contains public `GitHubEx` modules.
- `codegen/` and `build_support/` support OpenAPI generation and build tooling.
- `test/` contains ExUnit coverage.
- `doc/` is generated output and should not be edited.

## Execution Plane Stack
- `github_ex` consumes `pristine` as the semantic HTTP runtime; do not reach into raw `execution_plane` internals.
- Committed dependency tuples remain ordinary Hex requirements so standalone
  clones and published consumers work without workspace tooling. Managed
  development loads the MWO bootstrap and gets eligible source coordinates
  from Portfolio Registry; operator preferences stay outside this repository.
- MWO's process-scoped bootstrap pointer is the only dependency-management
  environment input read by `mix.exs`; publish mode remains Hex-only.
- This repo is not a Weld consumer in this pass and must not receive a blind Weld dependency.

## Runtime Environment
- Runtime application code under `lib/**` must not call direct OS env APIs such as `System.get_env`, `System.fetch_env`, `System.put_env`, or `System.delete_env`.
- Runtime and deployment env reads belong in `config/runtime.exs` or an explicit `Config.Provider`.
- Library APIs and Mix tasks receive explicit options, config structs, credential providers, application config materialized by the top-level app, or caller-supplied env maps.
- Tests may manipulate env only for config-boundary, SDK compatibility, or live-wrapper checks.
- Live GitHub commands use `~/scripts/with_bash_secrets <command>` and must not print secrets.

## Gates
- Run `mix format`.
- Run `mix compile --warnings-as-errors`.
- Run `mix test`.
- Run `mix credo --strict`.
- Run `mix dialyzer`.
- Run `mix docs --warnings-as-errors`.
