# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.PastDisplayName do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :displayName,
    :updated_at
  ]

  @type t :: %__MODULE__{
          :displayName => String.t(),
          :updated_at => DateTime.t()
        }
end

defimpl Poison.Decoder, for: VRChat.Model.PastDisplayName do
  def decode(value, _options) do
    value
  end
end