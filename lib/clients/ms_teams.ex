defmodule ExMicrosoftBot.Client.MsTeams do
  @moduledoc """
  This module provides the Microsoft Teams specific functions
  """

  import ExMicrosoftBot.Client, only: [authed_req_options: 1, deserialize_response: 2]
  alias ExMicrosoftBot.{Models, TokenManager}

  def conversations_list(service_url, team_id) do
    api_endpoint =
      String.trim_trailing(service_url, "/") <>
      "/v3/teams/#{ URI.encode_www_form(team_id) }/conversations"

    decode_conversations =
      fn resp ->
        Poison.decode!(resp)
        |> Map.get("conversations", [])
        |> Models.ChannelAccount.parse()
        |> elem(1)
      end

    HTTPotion.get(api_endpoint, authed_req_options(api_endpoint))
    |> deserialize_response(decode_conversations)
  end
end
