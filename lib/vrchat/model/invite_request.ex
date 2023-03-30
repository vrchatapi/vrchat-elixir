# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.InviteRequest do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :instanceId,
    :messageSlot
  ]

  @type t :: %__MODULE__{
          :instanceId => String.t(),
          :messageSlot => integer() | nil
        }
end

defimpl Poison.Decoder, for: VRChat.Model.InviteRequest do
  def decode(value, _options) do
    value
  end
end
