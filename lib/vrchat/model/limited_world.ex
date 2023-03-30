# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.LimitedWorld do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :authorId,
    :authorName,
    :capacity,
    :created_at,
    :favorites,
    :heat,
    :id,
    :imageUrl,
    :labsPublicationDate,
    :name,
    :occupants,
    :organization,
    :popularity,
    :publicationDate,
    :releaseStatus,
    :tags,
    :thumbnailImageUrl,
    :unityPackages,
    :updated_at
  ]

  @type t :: %__MODULE__{
          :authorId => String.t(),
          :authorName => String.t(),
          :capacity => integer(),
          :created_at => DateTime.t(),
          :favorites => integer(),
          :heat => integer(),
          :id => String.t(),
          :imageUrl => String.t(),
          :labsPublicationDate => String.t(),
          :name => String.t(),
          :occupants => integer(),
          :organization => String.t(),
          :popularity => integer(),
          :publicationDate => String.t(),
          :releaseStatus => VRChat.Model.ReleaseStatus.t(),
          :tags => [VRChat.Model.String.t()],
          :thumbnailImageUrl => String.t(),
          :unityPackages => [VRChat.Model.LimitedUnityPackage.t()],
          :updated_at => DateTime.t()
        }
end

defimpl Poison.Decoder, for: VRChat.Model.LimitedWorld do
  import VRChat.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:releaseStatus, :struct, VRChat.Model.ReleaseStatus, options)
    |> deserialize(:unityPackages, :list, VRChat.Model.LimitedUnityPackage, options)
  end
end