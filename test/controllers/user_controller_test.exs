defmodule ApiJson.UserControllerTest do
  use ApiJson.ConnCase

  alias ApiJson.User
  @valid_attrs %{first_name: "some content", last_name: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = get conn, user_path(conn, :show, user)
    assert json_response(conn, 200)["data"] == %{"id" => user.user_id,
      "first_name" => user.first_name,
      "last_name" => user.last_name,
      "books" => []
      }
  end

  test "shows chosen resource and assoc books", %{conn: conn} do
    params         = %{ first_name: "Uriel", last_name: "Molina", books: [%{book: "book", editorial: "nameeee"}] }
    user_changeset = User.changeset(%User{}, params)
    user           = Repo.insert! user_changeset

    conn = get conn, user_path(conn, :show, user)
    assert json_response(conn, 200)["data"] == %{"id" => user.user_id,
      "first_name" => user.first_name,
      "last_name" => user.last_name,
      "books" => Enum.map(user.books , fn(book) -> %{ "book" => book.book, "editorial" => book.editorial } end)
    }
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, user_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(User, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = put conn, user_path(conn, :update, user), user: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(User, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = delete conn, user_path(conn, :delete, user)
    assert response(conn, 204)
    refute Repo.get(User, user.user_id)
  end
end
