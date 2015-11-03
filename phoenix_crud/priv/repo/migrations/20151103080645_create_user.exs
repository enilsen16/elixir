defmodule PhoenixCrud.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :content, :string

      timestamps
    end

  end
end
