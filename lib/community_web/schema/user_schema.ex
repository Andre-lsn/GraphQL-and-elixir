defmodule CommunityWeb.Schema.UserSchema do
  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :age, non_null(:integer)
    field :email, non_null(:string)
    field :cpf, non_null(:string)
  end
end
