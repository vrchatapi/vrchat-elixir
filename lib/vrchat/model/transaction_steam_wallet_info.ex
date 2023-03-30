# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.TransactionSteamWalletInfo do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :state,
    :country,
    :currency,
    :status
  ]

  @type t :: %__MODULE__{
          :state => String.t(),
          :country => String.t(),
          :currency => String.t(),
          :status => String.t()
        }
end

defimpl Poison.Decoder, for: VRChat.Model.TransactionSteamWalletInfo do
  def decode(value, _options) do
    value
  end
end
