# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.FileVersion do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :created_at,
    :deleted,
    :delta,
    :file,
    :signature,
    :status,
    :version
  ]

  @type t :: %__MODULE__{
          :created_at => DateTime.t(),
          :deleted => boolean() | nil,
          :delta => VRChat.Model.FileData.t() | nil,
          :file => VRChat.Model.FileData.t() | nil,
          :signature => VRChat.Model.FileData.t() | nil,
          :status => VRChat.Model.FileStatus.t(),
          :version => integer()
        }
end

defimpl Poison.Decoder, for: VRChat.Model.FileVersion do
  import VRChat.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:delta, :struct, VRChat.Model.FileData, options)
    |> deserialize(:file, :struct, VRChat.Model.FileData, options)
    |> deserialize(:signature, :struct, VRChat.Model.FileData, options)
    |> deserialize(:status, :struct, VRChat.Model.FileStatus, options)
  end
end
