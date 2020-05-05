defmodule ExMicrosoftBot.Models.ConversationResourceResponse do
  @moduledoc """
  Microsoft bot conversation API resource response
  """

  @derive [Poison.Encoder]
  defstruct [:id, :activityId]

  @type t :: %ExMicrosoftBot.Models.ResourceResponse{
    id: String.t,
    activityId: String.t
  }

  @doc """
  Decode a map into `ExMicrosoftBot.Models.ConversationResourceResponse`
  """
  @spec parse(map) :: {:ok, ExMicrosoftBot.Models.ConversationResourceResponse.t}
  def parse(param) when is_map(param) do
    {:ok, Poison.Decode.decode(param, as: decoding_map())}
  end

  @doc """
  Decode a string into `ExMicrosoftBot.Models.ConversationResourceResponse`
  """
  @spec parse(String.t) :: ExMicrosoftBot.Models.ConversationResourceResponse.t
  def parse(param) when is_binary(param) do
    Poison.decode!(param, as: decoding_map())
  end

  @doc false
  def decoding_map() do
    %ExMicrosoftBot.Models.ConversationResourceResponse{}
  end
end
