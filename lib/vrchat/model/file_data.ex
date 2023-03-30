# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.FileData do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :category,
    :fileName,
    :md5,
    :sizeInBytes,
    :status,
    :uploadId,
    :url
  ]

  @type t :: %__MODULE__{
          :category => String.t(),
          :fileName => String.t(),
          :md5 => String.t(),
          :sizeInBytes => integer(),
          :status => VRChat.Model.FileStatus.t(),
          :uploadId => String.t(),
          :url => String.t()
        }
end

defimpl Poison.Decoder, for: VRChat.Model.FileData do
  import VRChat.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:status, :struct, VRChat.Model.FileStatus, options)
  end
end