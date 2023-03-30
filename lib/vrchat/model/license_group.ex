# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.LicenseGroup do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :id,
    :name,
    :description,
    :licenses
  ]

  @type t :: %__MODULE__{
          :id => String.t(),
          :name => String.t(),
          :description => String.t(),
          :licenses => [VRChat.Model.License.t()]
        }
end

defimpl Poison.Decoder, for: VRChat.Model.LicenseGroup do
  import VRChat.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:licenses, :list, VRChat.Model.License, options)
  end
end
