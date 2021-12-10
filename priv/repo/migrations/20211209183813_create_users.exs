defmodule Community.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :text
      add :age, :integer
      add :cpf, :string

      timestamps()
    end
  end
end
