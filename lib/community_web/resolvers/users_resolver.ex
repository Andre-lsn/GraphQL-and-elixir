defmodule CommunityWeb.UsersResolver do
  alias Community.Users

  @spec all_users(any(), any(), any()) :: {:ok, [User.t()]} | {:ok, []}
  def all_users(_root, _args, _info) do
    {:ok, Users.list_users()}
  end

  @spec create_user(any(), map(), any()) :: {:ok, User.t()} | {:error, map()} | {:error, binary()}
  def create_user(_root, %{age: age} = args, _info) when age >= 18 do
    case Users.create_user(args) do
      {:ok, user} ->
        {:ok, user}
      _error ->
        {:error, %{message: "Not possible create user"}}
    end
  end

  def create_user(_root, _args, _info), do: {:error, "Allowed only users over 18 years old"}

  @spec delete_user(any(), map(), any()) :: any()
  def delete_user(_root, %{id: id}, _info) do
    id
    |> String.to_integer()
    |> Users.delete_user()
  end

  @spec user_by_email(any(), map(), any()) :: {:ok, User.t()} | map()
  def user_by_email(_root, %{email: email}, _info) do
    case Users.user_by_email(email) do
      {:ok, email} -> {:ok, email}
      {:detail, "User with this email not found"} -> %{message: "User with this email not found"}
    end
  end
end
