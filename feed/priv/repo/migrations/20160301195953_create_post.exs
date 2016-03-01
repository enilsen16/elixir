defmodule Feed.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :caption, :string

      timestamps
    end

  end
end
