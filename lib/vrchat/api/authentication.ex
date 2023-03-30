# NOTE: This file is auto generated by OpenAPI Generator 6.2.1 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule VRChat.Authentication do
  @moduledoc """
  API calls for all endpoints tagged `Authentication`.
  """

  alias VRChat.Connection
  import VRChat.RequestBuilder

  @doc """
  Check User Exists
  Checks if a user by a given `username`, `displayName` or `email` exist. This is used during registration to check if a username has already been taken, during change of displayName to check if a displayName is available, and during change of email to check if the email is already used. In the later two cases the `excludeUserId` is used to exclude oneself, otherwise the result would always be true.  It is **REQUIRED** to include **AT LEAST** `username`, `displayName` **or** `email` query parameter. Although they can be combined - in addition with `excludeUserId` (generally to exclude yourself) - to further fine-tune the search.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:email` (String.t): Filter by email.
    - `:displayName` (String.t): Filter by displayName.
    - `:userId` (String.t): Filter by UserID.
    - `:excludeUserId` (String.t): Exclude by UserID.

  ### Returns

  - `{:ok, VRChat.Model.UserExists.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec check_user_exists(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.UserExists.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def check_user_exists(connection, opts \\ []) do
    optional_params = %{
      :email => :query,
      :displayName => :query,
      :userId => :query,
      :excludeUserId => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/auth/exists")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.UserExists{}},
      {400, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Delete User
  Deletes the account with given ID. Normal users only have permission to delete their own account. Account deletion is 14 days from this request, and will be cancelled if you do an authenticated request with the account afterwards.  **VRC+ NOTE:** Despite the 14-days cooldown, any VRC+ subscription will be cancelled **immediately**.  **METHOD NOTE:** Despite this being a Delete action, the method type required is PUT.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `user_id` (String.t): Must be a valid user ID.
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.CurrentUser.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec delete_user(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, VRChat.Model.CurrentUser.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def delete_user(connection, user_id, _opts \\ []) do
    request =
      %{}
      |> method(:put)
      |> url("/users/#{user_id}/delete")
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.CurrentUser{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Login and/or Get Current User Info
  This endpoint does the following two operations:   1) Checks if you are already logged in by looking for a valid `auth` cookie. If you are have a valid auth cookie then no additional auth-related actions are taken. If you are **not** logged in then it will log you in with the `Authorization` header and set the `auth` cookie. The `auth` cookie will only be sent once.   2) If logged in, this function will also return the CurrentUser object containing detailed information about the currently logged in user.  The auth string after `Authorization: Basic {string}` is a base64-encoded string of the username and password, both individually url-encoded, and then joined with a colon.    > base64(urlencode(username):urlencode(password))  **WARNING: Session Limit:** Each authentication with login credentials counts as a separate session, out of which you have a limited amount. Make sure to save and reuse the `auth` cookie if you are often restarting the program. The provided API libraries automatically save cookies during runtime, but does not persist during restart. While it can be fine to use username/password during development, expect in production to very fast run into the rate-limit and be temporarily blocked from making new sessions until older ones expire. The exact number of simultaneous sessions is unknown/undisclosed.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.CurrentUser.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec get_current_user(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.CurrentUser.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def get_current_user(connection, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/auth/user")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.CurrentUser{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Logout
  Invalidates the login session.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.Success.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec logout(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.Success.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def logout(connection, _opts \\ []) do
    request =
      %{}
      |> method(:put)
      |> url("/logout")
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Success{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Verify 2FA code
  Finishes the login sequence with a normal 2FA-generated code for accounts with 2FA-protection enabled.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (TwoFactorAuthCode): 

  ### Returns

  - `{:ok, VRChat.Model.Verify2FaResult.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec verify2_fa(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.Verify2FaResult.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def verify2_fa(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/auth/twofactorauth/totp/verify")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Verify2FaResult{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Verify 2FA email code
  Finishes the login sequence with an 2FA email code.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (TwoFactorEmailCode): 

  ### Returns

  - `{:ok, VRChat.Model.Verify2FaEmailCodeResult.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec verify2_fa_email_code(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.Verify2FaEmailCodeResult.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def verify2_fa_email_code(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/auth/twofactorauth/emailotp/verify")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Verify2FaEmailCodeResult{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Verify Auth Token
  Verify whether the currently provided Auth Token is valid.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters

  ### Returns

  - `{:ok, VRChat.Model.VerifyAuthTokenResult.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec verify_auth_token(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.VerifyAuthTokenResult.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def verify_auth_token(connection, _opts \\ []) do
    request =
      %{}
      |> method(:get)
      |> url("/auth")
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.VerifyAuthTokenResult{}},
      {401, %VRChat.Model.Error{}}
    ])
  end

  @doc """
  Verify 2FA code with Recovery code
  Finishes the login sequence with an OTP (One Time Password) recovery code for accounts with 2FA-protection enabled.

  ### Parameters

  - `connection` (VRChat.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (TwoFactorAuthCode): 

  ### Returns

  - `{:ok, VRChat.Model.Verify2FaResult.t}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec verify_recovery_code(Tesla.Env.client(), keyword()) ::
          {:ok, VRChat.Model.Verify2FaResult.t()}
          | {:ok, VRChat.Model.Error.t()}
          | {:error, Tesla.Env.t()}
  def verify_recovery_code(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/auth/twofactorauth/otp/verify")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, %VRChat.Model.Verify2FaResult{}},
      {401, %VRChat.Model.Error{}}
    ])
  end
end
