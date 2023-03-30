# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Files do
  @moduledoc """
  API calls for all endpoints tagged `Files`.
  """

  alias VRChat.Connection
  import VRChat.RequestBuilder

  @doc """
  Create File
  Creates a new File object

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (CreateFileRequest): 

  ### Returns

  - `{:ok, VRChat.Model.File.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec create_file(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.File.t()} | {:error, Tesla.Env.t()}
  def create_file(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/file")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.File{}}
    ])
  end

  @doc """
  Create File Version
  Creates a new FileVersion. Once a Version has been created, proceed to the `/file/{fileId}/{versionId}/file/start` endpoint to start a file upload.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `file_id` (String.t): Must be a valid file ID.
  - `opts` (keyword): Optional parameters
    - `:body` (CreateFileVersionRequest): 

  ### Returns

  - `{:ok, VRChat.Model.File.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec create_file_version(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.File.t()} | {:error, Tesla.Env.t()}
  def create_file_version(connection, file_id, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/file/#{file_id}")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.File{}}
    ])
  end

  @doc """
  Delete File
  Deletes a File object.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `file_id` (String.t): Must be a valid file ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.Success.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec delete_file(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.Success.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def delete_file(connection, file_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/file/#{file_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Success{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Delete File Version
  Delete a specific version of a file. You can only delete the latest version.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `file_id` (String.t): Must be a valid file ID.
  - `version_id` (integer()): Version ID of the asset.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.File.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec delete_file_version(Tesla.Env.client(), String.t(), integer(), keyword()) ::
          {:ok, VRChat.Model.Error.t()} | {:ok, VRChat.Model.File.t()} | {:error, Tesla.Env.t()}
  def delete_file_version(connection, file_id, version_id, _opts \\ []) do
    request =
      %{}
      |> method(:delete)
      |> url("/file/#{file_id}/#{version_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.File{}},
      {400, %VRChat.Model.Error{}},
      {500, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Download File Version
  Downloads the file with the provided version number.  **Version Note:** Version 0 is always when the file was created. The real data is usually always located in version 1 and up.  **Extension Note:** Files are not guaranteed to have a file extensions. UnityPackage files tends to have it, images through this endpoint do not. You are responsible for appending file extension from the `extension` field when neccesary.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `file_id` (String.t): Must be a valid file ID.
  - `version_id` (integer()): Version ID of the asset.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec download_file_version(Tesla.Env.client(), String.t(), integer(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def download_file_version(connection, file_id, version_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/file/#{file_id}/#{version_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  Finish FileData Upload
  Finish an upload of a FileData. This will mark it as \"complete\". After uploading the `file` for Avatars and Worlds you then have to upload a `signature` file.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `file_id` (String.t): Must be a valid file ID.
  - `version_id` (integer()): Version ID of the asset.
  - `file_type` (String.t): Type of file.
  - `opts` (keyword): Optional parameters
    - `:body` (FinishFileDataUploadRequest): Please see documentation on ETag's: [https://teppen.io/2018/06/23/aws_s3_etags/](https://teppen.io/2018/06/23/aws_s3_etags/)  ETag's should NOT be present when uploading a `signature`.

  ### Returns

  - `{:ok, VRChat.Model.File.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec finish_file_data_upload(Tesla.Env.client(), String.t(), integer(), String.t(), keyword()) ::
          {:ok, VRChat.Model.File.t()} | {:error, Tesla.Env.t()}
  def finish_file_data_upload(connection, file_id, version_id, file_type, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:put)
      |> url("/file/#{file_id}/#{version_id}/#{file_type}/finish")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.File{}}
    ])
  end

  @doc """
  Show File
  Shows general information about the \"File\" object. Each File can have several \"Version\"'s, and each Version can have multiple real files or \"Data\" blobs.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `file_id` (String.t): Must be a valid file ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.File.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_file(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.Error.t()} | {:ok, VRChat.Model.File.t()} | {:error, Tesla.Env.t()}
  def get_file(connection, file_id, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/file/#{file_id}")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.File{}},
      {404, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Check FileData Upload Status
  Retrieves the upload status for file upload. Can currently only be accessed when `status` is `waiting`. Trying to access it on a file version already uploaded currently times out.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `file_id` (String.t): Must be a valid file ID.
  - `version_id` (integer()): Version ID of the asset.
  - `file_type` (String.t): Type of file.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.FileVersionUploadStatus.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_file_data_upload_status(
          Tesla.Env.client(),
          String.t(),
          integer(),
          String.t(),
          keyword()
        ) :: {:ok, VRChat.Model.FileVersionUploadStatus.t()} | {:error, Tesla.Env.t()}
  def get_file_data_upload_status(connection, file_id, version_id, file_type, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/file/#{file_id}/#{version_id}/#{file_type}/status")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.FileVersionUploadStatus{}}
    ])
  end

  @doc """
  List Files
  Returns a list of files

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:tag` (String.t): Tag, for example \"icon\" or \"gallery\", not included by default.
    - `:userId` (String.t): UserID, will always generate a 500 permission error.
    - `:n` (integer()): The number of objects to return.
    - `:offset` (integer()): A zero-based offset from the default object sorting from where search results start.

  ### Returns

  - `{:ok, [%File{}, ...]}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_files(Tesla.Env.client(), keyword()) ::
          {:ok, list(VRChat.Model.File.t())} | {:error, Tesla.Env.t()}
  def get_files(connection, opts \\ []) do
    optional_params = %{
      :tag => :query,
      :userId => :query,
      :n => :query,
      :offset => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/files")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, [%VRChat.Model.File{}]}
    ])
  end

  @doc """
  Start FileData Upload
  Starts an upload of a specific FilePart. This endpoint will return an AWS URL which you can PUT data to. You need to call this and receive a new AWS API URL for each `partNumber`. Please see AWS's REST documentation on \"PUT Object to S3\" on how to upload. Once all parts has been uploaded, proceed to `/finish` endpoint.  **Note:** `nextPartNumber` seems like it is always ignored. Despite it returning 0, first partNumber is always 1.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `file_id` (String.t): Must be a valid file ID.
  - `version_id` (integer()): Version ID of the asset.
  - `file_type` (String.t): Type of file.
  - `opts` (keyword): Optional parameters
    - `:partNumber` (integer()): The part number to start uploading. If not provided, the first part will be started.

  ### Returns

  - `{:ok, VRChat.Model.FileUploadUrl.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec start_file_data_upload(Tesla.Env.client(), String.t(), integer(), String.t(), keyword()) ::
          {:ok, VRChat.Model.FileUploadUrl.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def start_file_data_upload(connection, file_id, version_id, file_type, opts \\ []) do
    optional_params = %{
      :partNumber => :query
    }

    request =
      %{}
      |> method(:put)
      |> url("/file/#{file_id}/#{version_id}/#{file_type}/start")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.FileUploadUrl{}},
      {400, %VRChat.Model.Error{}}
    ])
  end
end
