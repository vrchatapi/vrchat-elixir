# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.CreateFileRequest do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :name,
    :mimeType,
    :extension,
    :tags
  ]

  @type t :: %__MODULE__{
          :name => String.t(),
          :mimeType => VRChat.Model.MimeType.t(),
          :extension => String.t(),
          :tags => [VRChat.Model.String.t()] | nil
        }
end

defimpl Poison.Decoder, for: VRChat.Model.CreateFileRequest do
  import VRChat.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:mimeType, :struct, VRChat.Model.MimeType, options)
  end
end
