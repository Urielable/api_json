defmodule ApiJson.Book do
  use ApiJson.Web, :model

  @derive {Phoenix.Param, key: :book_id}
  @primary_key {:book_id, :id, autogenerate: true}

  schema "books" do
    field :book, :string
    field :editorial, :string

    belongs_to :user, ApiJson.User, references: :user_id

    timestamps
  end

  @required_fields ~w(book editorial)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
