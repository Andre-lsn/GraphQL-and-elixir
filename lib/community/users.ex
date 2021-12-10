defmodule Community.Users do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Community.Repo

  alias Community.Users.User

  @spec list_users :: [User.t()] | []
  def list_users, do: Repo.all(User)

  @spec get_user!(integer()) :: User.t()
  def get_user!(user_id), do: Repo.get!(User, user_id)

  @spec user_by_email(binary()) :: {:ok, User.t()} | {:detail, binary()}
  def user_by_email(email) do
    case Repo.get_by(User, email: email) do
      user -> {:ok, user}
      nil -> {:detail, "User with this email not found"}
    end
  end

  @spec create_user(map()) :: {:ok, User.t()} | Ecto.Changeset.t()
  def create_user(attrs \\ %{}) do
    attrs
    |> User.create_changeset()
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.update_changeset(attrs)
    |> Repo.update()
  end

  @spec delete_user(integer()) :: {:ok, User.t()}
  def delete_user(user_id) do
    user_id
    |> get_user!()
    |> Repo.delete()
  end
end
