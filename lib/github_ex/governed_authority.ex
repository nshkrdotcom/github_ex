defmodule GitHubEx.GovernedAuthority do
  @moduledoc """
  GitHub-specific authority materialization for governed client construction.

  Standalone clients continue to pass direct tokens, OAuth sources, and local
  config. Governed clients pass an authority packet with bounded GitHub refs and
  authority-selected credential material.
  """

  alias Pristine.GovernedAuthority, as: PristineAuthority

  @redaction_marker "[REDACTED]"
  @default_provider_refs ["github", "github_rest", "github_ex", "provider://github"]
  @token_families %{
    "fine_grained_pat" => :bearer,
    "classic_pat" => :bearer,
    "github_token" => :bearer,
    "oauth_user_token" => :bearer,
    "github_app_jwt" => :bearer,
    "installation_token" => :bearer,
    "app_user_token" => :bearer,
    "oauth_application_basic" => :basic
  }
  @direct_client_keys [
    :auth,
    :oauth2,
    :base_url,
    :accept,
    :api_version,
    :user_agent,
    :foundation,
    :headers,
    :default_headers,
    :default_auth,
    :extra_headers,
    :token,
    :access_token,
    :client_id,
    :client_secret,
    :app_id,
    :private_key,
    :pem,
    :installation_id,
    :webhook_secret,
    :oauth_token_path,
    :token_source,
    :env,
    :default_client,
    :middleware,
    :provider_payload
  ]
  @request_direct_keys [
    :auth,
    :headers,
    :base_url,
    :oauth2,
    :token,
    :access_token,
    :client_id,
    :client_secret,
    :app_id,
    :private_key,
    :pem,
    :installation_id,
    :webhook_secret,
    :oauth_token_path,
    :token_source,
    :env,
    :default_client,
    :middleware,
    :provider_payload
  ]

  @type header_map :: %{optional(String.t()) => String.t()}

  @type t :: %__MODULE__{
          authority_ref: String.t(),
          provider_ref: String.t(),
          base_url_ref: String.t(),
          provider_account_ref: String.t(),
          connector_instance_ref: String.t(),
          credential_handle_ref: String.t(),
          credential_lease_ref: String.t(),
          credential_family_ref: String.t(),
          token_family: String.t(),
          app_ref: String.t() | nil,
          installation_ref: String.t() | nil,
          oauth_app_ref: String.t() | nil,
          webhook_ref: String.t() | nil,
          target_ref: String.t(),
          request_scope_ref: String.t(),
          operation_policy_ref: String.t(),
          header_policy_ref: String.t(),
          redaction_ref: String.t() | nil,
          materialization_kind: String.t(),
          materialization_ref: String.t() | nil,
          bearer_token_ref: String.t() | nil,
          app_token_ref: String.t() | nil,
          installation_token_ref: String.t() | nil,
          user_token_ref: String.t() | nil,
          base_url: String.t(),
          headers: header_map(),
          credential_headers: header_map(),
          allowed_header_names: [String.t()],
          redaction_values: [String.t()],
          metadata: map(),
          pristine_authority: PristineAuthority.t()
        }

  @enforce_keys [
    :authority_ref,
    :provider_ref,
    :base_url_ref,
    :provider_account_ref,
    :connector_instance_ref,
    :credential_handle_ref,
    :credential_lease_ref,
    :credential_family_ref,
    :token_family,
    :target_ref,
    :request_scope_ref,
    :operation_policy_ref,
    :header_policy_ref,
    :materialization_kind,
    :base_url,
    :headers,
    :credential_headers,
    :allowed_header_names,
    :redaction_values,
    :metadata,
    :pristine_authority
  ]
  defstruct [
    :authority_ref,
    :provider_ref,
    :base_url_ref,
    :provider_account_ref,
    :connector_instance_ref,
    :credential_handle_ref,
    :credential_lease_ref,
    :credential_family_ref,
    :token_family,
    :app_ref,
    :installation_ref,
    :oauth_app_ref,
    :webhook_ref,
    :target_ref,
    :request_scope_ref,
    :operation_policy_ref,
    :header_policy_ref,
    :redaction_ref,
    :materialization_kind,
    :materialization_ref,
    :bearer_token_ref,
    :app_token_ref,
    :installation_token_ref,
    :user_token_ref,
    :base_url,
    :headers,
    :credential_headers,
    :allowed_header_names,
    :redaction_values,
    :metadata,
    :pristine_authority
  ]

  @spec client_authority!(keyword(), keyword()) :: t() | nil
  def client_authority!(opts, defaults) when is_list(opts) and is_list(defaults) do
    case fetch_value(opts, :governed_authority, nil) do
      nil ->
        nil

      authority_opts ->
        reject_direct_client_opts!(opts)
        new!(authority_opts, defaults)
    end
  end

  @spec new!(t() | map() | keyword(), keyword()) :: t()
  def new!(authority, defaults \\ [])

  def new!(%__MODULE__{} = authority, _defaults) do
    validate!(authority)
  end

  def new!(opts, defaults) when is_list(opts) and is_list(defaults) do
    opts
    |> Map.new()
    |> new!(defaults)
  end

  def new!(%{} = opts, defaults) when is_list(defaults) do
    token_family = token_family!(opts)
    credential_headers = credential_headers!(opts, token_family)
    authority_headers = authority_headers!(opts, defaults)
    authority_ref = required_string!(opts, :authority_ref)
    provider_ref = required_string!(opts, :provider_ref)
    base_url_ref = required_ref!(opts, :base_url_ref, ["base-url://"])
    provider_account_ref = required_ref!(opts, :provider_account_ref, ["provider-account://"])

    connector_instance_ref =
      required_ref!(opts, :connector_instance_ref, ["connector-instance://"])

    credential_handle_ref =
      required_ref!(opts, :credential_handle_ref, [
        "credential-handle://",
        "urn:credential-handle:"
      ])

    credential_lease_ref = required_ref!(opts, :credential_lease_ref, ["credential-lease://"])
    credential_family_ref = required_string!(opts, :credential_family_ref)
    target_ref = required_ref!(opts, :target_ref, ["target://"])
    request_scope_ref = required_ref!(opts, :request_scope_ref, ["request-scope://"])
    operation_policy_ref = required_ref!(opts, :operation_policy_ref, ["operation-policy://"])
    header_policy_ref = required_ref!(opts, :header_policy_ref, ["header-policy://"])
    redaction_ref = optional_string(opts, :redaction_ref)
    base_url = required_string!(opts, :base_url)
    materialization_kind = materialization_kind(token_family)
    materialization_refs = materialization_refs!(opts, token_family)

    validate_provider_ref!(provider_ref)
    validate_family_refs!(credential_family_ref, token_family)
    validate_family_specific_refs!(opts, token_family)

    redaction_values =
      opts
      |> fetch_value(:redaction_values, [])
      |> normalize_redaction_values()
      |> add_redaction_values(secret_values(opts, credential_headers))

    metadata = %{
      authority_ref: authority_ref,
      provider_ref: provider_ref,
      base_url_ref: base_url_ref,
      provider_account_ref: provider_account_ref,
      connector_instance_ref: connector_instance_ref,
      credential_handle_ref: credential_handle_ref,
      credential_lease_ref: credential_lease_ref,
      credential_family_ref: credential_family_ref,
      token_family: token_family,
      app_ref: optional_string(opts, :app_ref),
      installation_ref: optional_string(opts, :installation_ref),
      oauth_app_ref: optional_string(opts, :oauth_app_ref),
      webhook_ref: optional_string(opts, :webhook_ref),
      target_ref: target_ref,
      request_scope_ref: request_scope_ref,
      operation_policy_ref: operation_policy_ref,
      header_policy_ref: header_policy_ref,
      redaction_ref: redaction_ref
    }

    pristine_authority =
      PristineAuthority.new!(
        base_url: base_url,
        base_url_ref: base_url_ref,
        authority_ref: authority_ref,
        provider_account_ref: provider_account_ref,
        connector_instance_ref: connector_instance_ref,
        credential_handle_ref: credential_handle_ref,
        credential_lease_ref: credential_lease_ref,
        target_ref: target_ref,
        request_scope_ref: request_scope_ref,
        operation_policy_ref: operation_policy_ref,
        header_policy_ref: header_policy_ref,
        redaction_ref: redaction_ref,
        materialization_kind: materialization_kind,
        materialization_ref: optional_string(opts, :materialization_ref),
        bearer_token_ref: materialization_refs.bearer_token_ref,
        app_token_ref: materialization_refs.app_token_ref,
        installation_token_ref: materialization_refs.installation_token_ref,
        user_token_ref: materialization_refs.user_token_ref,
        headers: authority_headers,
        credential_headers: credential_headers,
        allowed_header_names:
          allowed_header_names(
            fetch_value(opts, :allowed_header_names, []),
            authority_headers,
            credential_headers
          )
      )

    %__MODULE__{
      authority_ref: authority_ref,
      provider_ref: provider_ref,
      base_url_ref: base_url_ref,
      provider_account_ref: provider_account_ref,
      connector_instance_ref: connector_instance_ref,
      credential_handle_ref: credential_handle_ref,
      credential_lease_ref: credential_lease_ref,
      credential_family_ref: credential_family_ref,
      token_family: token_family,
      app_ref: metadata.app_ref,
      installation_ref: metadata.installation_ref,
      oauth_app_ref: metadata.oauth_app_ref,
      webhook_ref: metadata.webhook_ref,
      target_ref: target_ref,
      request_scope_ref: request_scope_ref,
      operation_policy_ref: operation_policy_ref,
      header_policy_ref: header_policy_ref,
      redaction_ref: redaction_ref,
      materialization_kind: materialization_kind,
      materialization_ref: optional_string(opts, :materialization_ref),
      bearer_token_ref: materialization_refs.bearer_token_ref,
      app_token_ref: materialization_refs.app_token_ref,
      installation_token_ref: materialization_refs.installation_token_ref,
      user_token_ref: materialization_refs.user_token_ref,
      base_url: base_url,
      headers: authority_headers,
      credential_headers: credential_headers,
      allowed_header_names: pristine_authority.allowed_header_names,
      redaction_values: redaction_values,
      metadata: metadata,
      pristine_authority: pristine_authority
    }
    |> validate!()
  end

  @spec governed_client?(term()) :: boolean()
  def governed_client?(%{__struct__: GitHubEx.Client, governed_authority: %__MODULE__{}}),
    do: true

  def governed_client?(_client), do: false

  @spec pristine_authority(t()) :: PristineAuthority.t()
  def pristine_authority(%__MODULE__{pristine_authority: authority}), do: authority

  @spec redact(t(), String.t()) :: String.t()
  def redact(%__MODULE__{redaction_values: values}, value) when is_binary(value) do
    Enum.reduce(values, value, fn secret, redacted ->
      String.replace(redacted, secret, @redaction_marker)
    end)
  end

  @spec reject_request_smuggling!(term(), map()) :: :ok
  def reject_request_smuggling!(client, request) when is_map(request) do
    if governed_client?(client) do
      reject_direct_request_values!(request)
    end

    :ok
  end

  @spec reject_generated_request_smuggling!(term(), map()) :: :ok
  def reject_generated_request_smuggling!(client, request) when is_map(request) do
    if governed_client?(client) do
      reject_generated_auth_override!(request)
      reject_present_direct!(request, :headers, "request headers")
    end

    :ok
  end

  @spec reject_app_auth_smuggling!(keyword()) :: :ok
  def reject_app_auth_smuggling!(opts) when is_list(opts) do
    if present_direct_option?(opts, :governed_authority) do
      raise ArgumentError,
            "governed authority rejects direct GitHub App credentials; use authority materialization"
    end

    :ok
  end

  defp validate!(%__MODULE__{credential_headers: credential_headers} = authority) do
    if map_size(credential_headers) == 0 do
      raise ArgumentError, "governed authority requires credential headers"
    end

    authority
  end

  defp reject_direct_client_opts!(opts) do
    Enum.each(@direct_client_keys, fn key ->
      reject_present_direct!(opts, key, to_string(key))
    end)
  end

  defp reject_direct_request_values!(request) do
    Enum.each(@request_direct_keys, fn key ->
      reject_present_direct!(request, key, "request #{key}")
    end)

    if fetch_value(request, :use_default_auth, true) == false do
      raise ArgumentError,
            "governed authority rejects direct request use_default_auth; use authority materialization"
    end

    case fetch_value(request, :opts, []) do
      opts when is_list(opts) ->
        Enum.each([:auth, :headers, :base_url], fn key ->
          reject_present_direct!(opts, key, "request opts #{key}")
        end)

      _other ->
        :ok
    end
  end

  defp reject_generated_auth_override!(request) do
    auth = fetch_value(request, :auth, nil)

    override =
      case auth do
        %{} -> fetch_value(auth, :override, nil)
        _other -> auth
      end

    if present_value?(override) do
      raise ArgumentError,
            "governed authority rejects direct request auth; use authority materialization"
    end
  end

  defp reject_present_direct!(opts, key, label) do
    if present_direct_option?(opts, key) do
      raise ArgumentError,
            "governed authority rejects direct #{label}; use authority materialization"
    end
  end

  defp token_family!(opts) do
    token_family =
      opts
      |> fetch_value(:token_family, fetch_value(opts, :credential_family_ref, nil))
      |> normalize_family()

    if Map.has_key?(@token_families, token_family) do
      token_family
    else
      raise ArgumentError,
            "governed authority has unknown GitHub token family #{inspect(token_family)}"
    end
  end

  defp validate_provider_ref!(provider_ref) do
    if provider_ref not in @default_provider_refs do
      raise ArgumentError,
            "governed authority has unknown GitHub provider ref #{inspect(provider_ref)}"
    end
  end

  defp validate_family_refs!(credential_family_ref, token_family) do
    if normalize_family(credential_family_ref) != token_family do
      raise ArgumentError, "governed authority credential family and token family must match"
    end
  end

  defp materialization_kind("github_app_jwt"), do: "app_token"
  defp materialization_kind("installation_token"), do: "installation_token"
  defp materialization_kind("app_user_token"), do: "user_token"
  defp materialization_kind("oauth_user_token"), do: "user_token"
  defp materialization_kind("oauth_application_basic"), do: "app_token"
  defp materialization_kind(_token_family), do: "bearer"

  defp materialization_refs!(opts, token_family) do
    empty = %{
      bearer_token_ref: nil,
      app_token_ref: nil,
      installation_token_ref: nil,
      user_token_ref: nil
    }

    case materialization_kind(token_family) do
      "app_token" ->
        Map.put(empty, :app_token_ref, required_ref!(opts, :app_token_ref, ["app-token://"]))

      "installation_token" ->
        Map.put(
          empty,
          :installation_token_ref,
          required_ref!(opts, :installation_token_ref, ["installation-token://"])
        )

      "user_token" ->
        Map.put(empty, :user_token_ref, required_ref!(opts, :user_token_ref, ["user-token://"]))

      "bearer" ->
        Map.put(
          empty,
          :bearer_token_ref,
          required_ref!(opts, :bearer_token_ref, ["bearer-token://"])
        )
    end
  end

  defp required_ref!(opts, key, allowed_prefixes) do
    value = required_string!(opts, key)

    if Enum.any?(allowed_prefixes, &String.starts_with?(value, &1)) do
      value
    else
      raise ArgumentError, "governed authority requires #{key} with an allowed ref prefix"
    end
  end

  defp validate_family_specific_refs!(opts, token_family) do
    case token_family do
      "github_app_jwt" ->
        required_string!(opts, :app_ref)

      "installation_token" ->
        required_string!(opts, :app_ref)
        required_string!(opts, :installation_ref)

      "app_user_token" ->
        required_string!(opts, :app_ref)
        required_string!(opts, :installation_ref)

      "oauth_user_token" ->
        required_string!(opts, :oauth_app_ref)

      "oauth_application_basic" ->
        required_string!(opts, :oauth_app_ref)

      _other ->
        :ok
    end
  end

  defp credential_headers!(opts, token_family) do
    case normalize_headers(fetch_value(opts, :credential_headers, %{})) do
      headers when map_size(headers) > 0 ->
        headers

      _empty ->
        build_credential_headers!(opts, Map.fetch!(@token_families, token_family))
    end
  end

  defp build_credential_headers!(opts, :bearer) do
    token = required_string!(opts, :token)
    %{"Authorization" => "Bearer " <> token}
  end

  defp build_credential_headers!(opts, :basic) do
    client_id = required_string!(opts, :client_id)
    client_secret = required_string!(opts, :client_secret)
    encoded = Base.encode64(client_id <> ":" <> client_secret)
    %{"Authorization" => "Basic " <> encoded}
  end

  defp authority_headers!(opts, defaults) do
    headers =
      %{}
      |> maybe_put_header("Accept", required_default!(defaults, :accept))
      |> maybe_put_header("User-Agent", required_default!(defaults, :user_agent))
      |> maybe_put_header("X-GitHub-Api-Version", required_default!(defaults, :api_version))
      |> Map.merge(normalize_headers(fetch_value(opts, :headers, %{})))

    if authorization_header?(headers) do
      raise ArgumentError,
            "governed authority rejects direct Authorization headers; use credential headers"
    end

    headers
  end

  defp authorization_header?(headers) do
    Enum.any?(headers, fn {name, _value} -> String.downcase(name) == "authorization" end)
  end

  defp maybe_put_header(headers, name, value), do: Map.put(headers, name, value)

  defp required_default!(defaults, key) do
    case Keyword.fetch(defaults, key) do
      {:ok, value} when is_binary(value) and value != "" -> value
      _other -> raise ArgumentError, "governed authority requires default #{key}"
    end
  end

  defp secret_values(opts, credential_headers) do
    token = optional_string(opts, :token)
    client_secret = optional_string(opts, :client_secret)
    header_values = Map.values(credential_headers)

    [token, client_secret | header_values]
    |> Enum.reject(&blank?/1)
  end

  defp normalize_redaction_values(values) when is_list(values) do
    values
    |> Enum.map(&optional_to_string/1)
    |> Enum.reject(&blank?/1)
    |> sort_redaction_values()
  end

  defp normalize_redaction_values(value) do
    value
    |> List.wrap()
    |> normalize_redaction_values()
  end

  defp add_redaction_values(values, additional_values) do
    (values ++ additional_values)
    |> Enum.uniq()
    |> sort_redaction_values()
  end

  defp sort_redaction_values(values) do
    Enum.sort_by(values, &byte_size/1, :desc)
  end

  defp normalize_family(value) do
    value = value |> optional_to_string() |> String.trim()

    if String.contains?(value, "/") do
      value |> String.split("/") |> List.last()
    else
      value
    end
  end

  defp required_string!(opts, key) do
    case optional_string(opts, key) do
      value when is_binary(value) and value != "" ->
        value

      _other ->
        raise ArgumentError, "governed authority requires #{key}"
    end
  end

  defp optional_string(opts, key) do
    opts
    |> fetch_value(key, nil)
    |> optional_to_string()
  end

  defp optional_to_string(nil), do: nil
  defp optional_to_string(value) when is_binary(value), do: value
  defp optional_to_string(value) when is_atom(value), do: Atom.to_string(value)
  defp optional_to_string(value), do: to_string(value)

  defp fetch_value(opts, key, default) when is_map(opts) do
    string_key = Atom.to_string(key)

    cond do
      Map.has_key?(opts, key) -> Map.get(opts, key)
      Map.has_key?(opts, string_key) -> Map.get(opts, string_key)
      true -> default
    end
  end

  defp fetch_value(opts, key, default) when is_list(opts) do
    string_key = Atom.to_string(key)

    cond do
      Keyword.has_key?(opts, key) ->
        Keyword.get(opts, key)

      List.keymember?(opts, string_key, 0) ->
        {^string_key, value} = List.keyfind(opts, string_key, 0)
        value

      true ->
        default
    end
  end

  defp present_direct_option?(opts, key) do
    opts
    |> fetch_value(key, nil)
    |> present_value?()
  end

  defp present_value?(nil), do: false
  defp present_value?(""), do: false
  defp present_value?([]), do: false
  defp present_value?(%{} = value), do: map_size(value) > 0
  defp present_value?(value) when is_list(value), do: value != []
  defp present_value?(_value), do: true

  defp blank?(nil), do: true
  defp blank?(""), do: true
  defp blank?(_value), do: false

  defp normalize_headers(headers) when is_map(headers) do
    Map.new(headers, fn {name, value} -> {to_string(name), to_string(value)} end)
  end

  defp normalize_headers(headers) when is_list(headers) do
    if Enum.all?(headers, &tuple_pair?/1) do
      Map.new(headers, fn {name, value} -> {to_string(name), to_string(value)} end)
    else
      %{}
    end
  end

  defp normalize_headers(_headers), do: %{}

  defp tuple_pair?({_name, _value}), do: true
  defp tuple_pair?(_entry), do: false

  defp allowed_header_names(names, authority_headers, credential_headers) do
    names
    |> normalize_header_names()
    |> Kernel.++(Map.keys(authority_headers))
    |> Kernel.++(Map.keys(credential_headers))
    |> Enum.map(&normalize_header_name/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.uniq()
  end

  defp normalize_header_names(names) when is_list(names) do
    names
    |> Enum.map(&normalize_header_name/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.uniq()
  end

  defp normalize_header_names(_names), do: []

  defp normalize_header_name(name) do
    name
    |> to_string()
    |> String.trim()
    |> String.downcase()
  end
end
