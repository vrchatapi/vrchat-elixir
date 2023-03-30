# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.LimitedUser do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :bio,
    :currentAvatarImageUrl,
    :currentAvatarThumbnailImageUrl,
    :developerType,
    :displayName,
    :fallbackAvatar,
    :id,
    :isFriend,
    :last_platform,
    :profilePicOverride,
    :status,
    :statusDescription,
    :tags,
    :userIcon,
    :username,
    :location,
    :friendKey
  ]

  @type t :: %__MODULE__{
          :bio => String.t() | nil,
          :currentAvatarImageUrl => String.t(),
          :currentAvatarThumbnailImageUrl => String.t(),
          :developerType => VRChat.Model.DeveloperType.t(),
          :displayName => String.t(),
          :fallbackAvatar => String.t(),
          :id => String.t(),
          :isFriend => boolean(),
          :last_platform => String.t(),
          :profilePicOverride => String.t(),
          :status => VRChat.Model.UserStatus.t(),
          :statusDescription => String.t(),
          :tags => [VRChat.Model.String.t()],
          :userIcon => String.t(),
          :username => String.t() | nil,
          :location => String.t() | nil,
          :friendKey => String.t() | nil
        }
end

defimpl Poison.Decoder, for: VRChat.Model.LimitedUser do
  import VRChat.Deserializer

  def decode(value, options) do
    value
    |> deserialize(:developerType, :struct, VRChat.Model.DeveloperType, options)
    |> deserialize(:status, :struct, VRChat.Model.UserStatus, options)
  end
end
