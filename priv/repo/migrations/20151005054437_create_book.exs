defmodule ApiJson.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :book_id, :serial, primary_key: true
      add :book, :string
      add :editorial, :string
      add :user_id, references(:users, [column: :user_id])

      timestamps
    end
    create index(:books, [:book_id])

  end
end
