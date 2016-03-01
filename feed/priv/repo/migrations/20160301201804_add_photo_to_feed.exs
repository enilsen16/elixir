defmodule Feed.Repo.Migrations.AddPhotoToFeed do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :photo, :string
    end
  end
end
