defmodule Feed.Post do
  use Feed.Web, :model
  use Arc.Ecto.Model

  schema "posts" do
    field :caption, :string
    field :photo, Feed.Photo.Type

    timestamps
  end

  @required_fields ~w(caption)
  @optional_fields ~w()

  @required_file_fields ~w()
  @optional_file_fields ~w(photo)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, @required_file_fields, @optional_file_fields)
  end
end
