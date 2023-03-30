# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Model.GroupMemberLimitedUser do
  @moduledoc """
  Only visible via the /groups/:groupId/members endpoint, **not** when fetching a specific user.
  """

  @derive [Poison.Encoder]
  defstruct [
    :id,
    :displayName,
    :thumbnailUrl,
    :iconUrl
  ]

  @type t :: %__MODULE__{
          :id => String.t() | nil,
          :displayName => String.t() | nil,
          :thumbnailUrl => String.t() | nil,
          :iconUrl => String.t() | nil
        }
end

defimpl Poison.Decoder, for: VRChat.Model.GroupMemberLimitedUser do
  def decode(value, _options) do
    value
  end
end
