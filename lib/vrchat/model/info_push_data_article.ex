# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule VRChat.Model.InfoPushDataArticle do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :content
  ]

  @type t :: %__MODULE__{
    :content => VRChat.Model.InfoPushDataArticleContent.t | nil
  }
end

defimpl Poison.Decoder, for: VRChat.Model.InfoPushDataArticle do
  import VRChat.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:content, :struct, VRChat.Model.InfoPushDataArticleContent, options)
  end
end
