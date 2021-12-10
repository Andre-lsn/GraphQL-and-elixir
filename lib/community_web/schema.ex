defmodule CommunityWeb.Schema do
  use Absinthe.Schema

  alias CommunityWeb.UsersResolver

  import_types CommunityWeb.Schema.UserSchema

  query do
    @desc "Get all users"
    field :all_users, non_null(list_of(non_null(:user))) do
      resolve(&UsersResolver.all_users/3)
    end

    @desc "Get user by email"
    field :get_user_by_email, :user do
      arg :email, non_null(:string)
      resolve &UsersResolver.user_by_email/3
    end
  end

  mutation do
    @desc "Create a new user"
    field :create_user, :user do
      arg :name, non_null(:string)
      arg :age, non_null(:integer)
      arg :email, non_null(:string)
      arg :cpf, non_null(:string)

      resolve &UsersResolver.create_user/3
    end

    @desc "Delete a user by id"
    field :delete_user, :user do
      arg :id, non_null(:id)
      resolve &UsersResolver.delete_user/3
    end
  end
end
