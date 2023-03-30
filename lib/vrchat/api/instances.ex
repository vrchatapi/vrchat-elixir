# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Instances do
  @moduledoc """
  API calls for all endpoints tagged `Instances`.
  """

  alias VRChat.Connection
  import VRChat.RequestBuilder

  @doc """
  Get Instance
  Returns an instance. Please read [Instances Tutorial](https://vrchatapi.github.io/tutorials/instances/) for more information on Instances.  If an invalid instanceId is provided, this endpoint will simply return \"null\"!

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `instance_id` (String.t): Must be a valid instance ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.Instance.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_instance(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, VRChat.Model.Instance.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_instance(connection, world_id, instance_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/instances/#{world_id}:#{instance_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Instance{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Get Instance By Short Name
  Returns an instance. Please read [Instances Tutorial](https://vrchatapi.github.io/tutorials/instances/) for more information on Instances.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `short_name` (String.t): Must be a valid instance short name.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.Instance.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_instance_by_short_name(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.Instance.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_instance_by_short_name(connection, short_name, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/instances/s/#{short_name}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Instance{}},
      {401, %VRChat.Model.Error{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Get Instance Short Name
  Returns an instance short name.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `instance_id` (String.t): Must be a valid instance ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.InstanceShortNameResponse.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_short_name(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, VRChat.Model.InstanceShortNameResponse.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_short_name(connection, world_id, instance_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/instances/#{world_id}:#{instance_id}/shortName")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.InstanceShortNameResponse{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Send Self Invite
  Sends an invite to the instance to yourself.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `instance_id` (String.t): Must be a valid instance ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.Success.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec send_self_invite(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, VRChat.Model.Success.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def send_self_invite(connection, world_id, instance_id, _opts \\ []) do
    request =
      %{}
      |> method(:post)
      |> url("/instances/#{world_id}:#{instance_id}/invite")
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Success{}},
      {401, %VRChat.Model.Error{}}
    ])
  end
end