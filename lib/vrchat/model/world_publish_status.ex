# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.WorldPublishStatus do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :canPubilsh
  ]

  @type t :: %__MODULE__{
          :canPubilsh => boolean()
        }
end

defimpl Poison.Decoder, for: VRChat.Model.WorldPublishStatus do
  def decode(value, _options) do
    value
  end
end
