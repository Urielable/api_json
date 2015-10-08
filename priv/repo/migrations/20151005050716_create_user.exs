defmodule ApiJson.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :serial, primary_key: true
      add :first_name, :string
      add :last_name, :string

      timestamps
    end

  end
end
