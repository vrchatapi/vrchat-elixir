# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Worlds do
  @moduledoc """
  API calls for all endpoints tagged `Worlds`.
  """

  alias VRChat.Connection
  import VRChat.RequestBuilder

  @doc """
  Create World
  Create a new world. This endpoint requires `assetUrl` to be a valid File object with `.vrcw` file extension, and `imageUrl` to be a valid File object with an image file extension.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (CreateWorldRequest): 

  ### Returns

  - `{:ok, VRChat.Model.World.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec create_world(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.World.t()} | {:ok, VRChat.Model.Error.t()} | {:error, Tesla.Env.t()}
  def create_world(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/worlds")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.World{}},
      {400, %VRChat.Model.Error{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Delete World
  Delete a world. Notice a world is never fully \"deleted\", only its ReleaseStatus is set to \"hidden\" and the linked Files are deleted. The WorldID is permanently reserved.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec delete_world(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:ok, VRChat.Model.Error.t()} | {:error, Tesla.Env.t()}
  def delete_world(connection, world_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/worlds/#{world_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false},
      {401, %VRChat.Model.Error{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  List Active Worlds
  Search and list currently Active worlds by query filters.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:featured` (boolean()): Filters on featured results.
    - `:sort` (SortOption): The sort order of the results.
    - `:n` (integer()): The number of objects to return.
    - `:order` (OrderOption): Result ordering
    - `:offset` (integer()): A zero-based offset from the default object sorting from where search results start.
    - `:search` (String.t): Filters by world name.
    - `:tag` (String.t): Tags to include (comma-separated). Any of the tags needs to be present.
    - `:notag` (String.t): Tags to exclude (comma-separated).
    - `:releaseStatus` (ReleaseStatus): Filter by ReleaseStatus.
    - `:maxUnityVersion` (String.t): The maximum Unity version supported by the asset.
    - `:minUnityVersion` (String.t): The minimum Unity version supported by the asset.
    - `:platform` (String.t): The platform the asset supports.

  ### Returns

  - `{:ok, [%LimitedWorld{}, ...]}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_active_worlds(Tesla.Env.client(), keyword()) ::
          {:ok, list(VRChat.Model.LimitedWorld.t())}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_active_worlds(connection, opts \\ []) do
    optional_params = %{
      :featured => :query,
      :sort => :query,
      :n => :query,
      :order => :query,
      :offset => :query,
      :search => :query,
      :tag => :query,
      :notag => :query,
      :releaseStatus => :query,
      :maxUnityVersion => :query,
      :minUnityVersion => :query,
      :platform => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/worlds/active")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, [%VRChat.Model.LimitedWorld{}]},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  List Favorited Worlds
  Search and list favorited worlds by query filters.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:featured` (boolean()): Filters on featured results.
    - `:sort` (SortOption): The sort order of the results.
    - `:n` (integer()): The number of objects to return.
    - `:order` (OrderOption): Result ordering
    - `:offset` (integer()): A zero-based offset from the default object sorting from where search results start.
    - `:search` (String.t): Filters by world name.
    - `:tag` (String.t): Tags to include (comma-separated). Any of the tags needs to be present.
    - `:notag` (String.t): Tags to exclude (comma-separated).
    - `:releaseStatus` (ReleaseStatus): Filter by ReleaseStatus.
    - `:maxUnityVersion` (String.t): The maximum Unity version supported by the asset.
    - `:minUnityVersion` (String.t): The minimum Unity version supported by the asset.
    - `:platform` (String.t): The platform the asset supports.
    - `:userId` (String.t): Target user to see information on, admin-only.

  ### Returns

  - `{:ok, [%LimitedWorld{}, ...]}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_favorited_worlds(Tesla.Env.client(), keyword()) ::
          {:ok, list(VRChat.Model.LimitedWorld.t())}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_favorited_worlds(connection, opts \\ []) do
    optional_params = %{
      :featured => :query,
      :sort => :query,
      :n => :query,
      :order => :query,
      :offset => :query,
      :search => :query,
      :tag => :query,
      :notag => :query,
      :releaseStatus => :query,
      :maxUnityVersion => :query,
      :minUnityVersion => :query,
      :platform => :query,
      :userId => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/worlds/favorites")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, [%VRChat.Model.LimitedWorld{}]},
      {401, %VRChat.Model.Error{}},
      {403, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  List Recent Worlds
  Search and list recently visited worlds by query filters.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:featured` (boolean()): Filters on featured results.
    - `:sort` (SortOption): The sort order of the results.
    - `:n` (integer()): The number of objects to return.
    - `:order` (OrderOption): Result ordering
    - `:offset` (integer()): A zero-based offset from the default object sorting from where search results start.
    - `:search` (String.t): Filters by world name.
    - `:tag` (String.t): Tags to include (comma-separated). Any of the tags needs to be present.
    - `:notag` (String.t): Tags to exclude (comma-separated).
    - `:releaseStatus` (ReleaseStatus): Filter by ReleaseStatus.
    - `:maxUnityVersion` (String.t): The maximum Unity version supported by the asset.
    - `:minUnityVersion` (String.t): The minimum Unity version supported by the asset.
    - `:platform` (String.t): The platform the asset supports.
    - `:userId` (String.t): Target user to see information on, admin-only.

  ### Returns

  - `{:ok, [%LimitedWorld{}, ...]}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_recent_worlds(Tesla.Env.client(), keyword()) ::
          {:ok, list(VRChat.Model.LimitedWorld.t())}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_recent_worlds(connection, opts \\ []) do
    optional_params = %{
      :featured => :query,
      :sort => :query,
      :n => :query,
      :order => :query,
      :offset => :query,
      :search => :query,
      :tag => :query,
      :notag => :query,
      :releaseStatus => :query,
      :maxUnityVersion => :query,
      :minUnityVersion => :query,
      :platform => :query,
      :userId => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/worlds/recent")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, [%VRChat.Model.LimitedWorld{}]},
      {401, %VRChat.Model.Error{}},
      {403, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Get World by ID
  Get information about a specific World. Works unauthenticated but when so will always return `0` for certain fields.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.World.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_world(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.World.t()} | {:ok, VRChat.Model.Error.t()} | {:error, Tesla.Env.t()}
  def get_world(connection, world_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/worlds/#{world_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.World{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Get World Instance
  Returns a worlds instance.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `instance_id` (String.t): Must be a valid instance ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.Instance.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_world_instance(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, VRChat.Model.Instance.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_world_instance(connection, world_id, instance_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/worlds/#{world_id}/#{instance_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Instance{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Get World Metadata
  Return a worlds custom metadata. This is currently believed to be unused. Metadata can be set with `updateWorld` and can be any arbitrary object.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.WorldMetadata.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_world_metadata(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.WorldMetadata.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_world_metadata(connection, world_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/worlds/#{world_id}/metadata")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.WorldMetadata{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Get World Publish Status
  Returns a worlds publish status.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.WorldPublishStatus.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_world_publish_status(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.WorldPublishStatus.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_world_publish_status(connection, world_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/worlds/#{world_id}/publish")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.WorldPublishStatus{}},
      {401, %VRChat.Model.Error{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Publish World
  Publish a world. You can only publish one world per week.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec publish_world(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:ok, VRChat.Model.Error.t()} | {:error, Tesla.Env.t()}
  def publish_world(connection, world_id, _opts \\ []) do
    request =
      %{}
      |> method(:put)
      |> url("/worlds/#{world_id}/publish")
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false},
      {401, %VRChat.Model.Error{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Search All Worlds
  Search and list any worlds by query filters.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:featured` (boolean()): Filters on featured results.
    - `:sort` (SortOption): The sort order of the results.
    - `:user` (String.t): Set to `me` for searching own worlds.
    - `:userId` (String.t): Filter by UserID.
    - `:n` (integer()): The number of objects to return.
    - `:order` (OrderOption): Result ordering
    - `:offset` (integer()): A zero-based offset from the default object sorting from where search results start.
    - `:search` (String.t): Filters by world name.
    - `:tag` (String.t): Tags to include (comma-separated). Any of the tags needs to be present.
    - `:notag` (String.t): Tags to exclude (comma-separated).
    - `:releaseStatus` (ReleaseStatus): Filter by ReleaseStatus.
    - `:maxUnityVersion` (String.t): The maximum Unity version supported by the asset.
    - `:minUnityVersion` (String.t): The minimum Unity version supported by the asset.
    - `:platform` (String.t): The platform the asset supports.

  ### Returns

  - `{:ok, [%LimitedWorld{}, ...]}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec search_worlds(Tesla.Env.client(), keyword()) ::
          {:ok, list(VRChat.Model.LimitedWorld.t())}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def search_worlds(connection, opts \\ []) do
    optional_params = %{
      :featured => :query,
      :sort => :query,
      :user => :query,
      :userId => :query,
      :n => :query,
      :order => :query,
      :offset => :query,
      :search => :query,
      :tag => :query,
      :notag => :query,
      :releaseStatus => :query,
      :maxUnityVersion => :query,
      :minUnityVersion => :query,
      :platform => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/worlds")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, [%VRChat.Model.LimitedWorld{}]},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Unpublish World
  Unpublish a world.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec unpublish_world(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:ok, VRChat.Model.Error.t()} | {:error, Tesla.Env.t()}
  def unpublish_world(connection, world_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/worlds/#{world_id}/publish")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false},
      {401, %VRChat.Model.Error{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Update World
  Update information about a specific World.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `world_id` (String.t): Must be a valid world ID.
  - `opts` (keyword): Optional parameters
    - `:body` (UpdateWorldRequest): 

  ### Returns

  - `{:ok, VRChat.Model.World.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec update_world(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.World.t()} | {:ok, VRChat.Model.Error.t()} | {:error, Tesla.Env.t()}
  def update_world(connection, world_id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:put)
      |> url("/worlds/#{world_id}")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.World{}},
      {401, %VRChat.Model.Error{}},
      {404, %VRChat.Model.Error{}}
    ])
  end
end