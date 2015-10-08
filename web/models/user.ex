defmodule ApiJson.User do
  use ApiJson.Web, :model

  @derive {Phoenix.Param, key: :user_id}
  @primary_key {:user_id, :id, autogenerate: true}
  schema "users" do
    field :first_name, :string
    field :last_name, :string

    has_many :books, ApiJson.Book, foreign_key: :user_id, references: :user_id

    timestamps
  end

  @required_fields ~w(first_name last_name)
  @optional_fields ~w(books)

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
