defmodule ApiJson.UserView do
  use ApiJson.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, ApiJson.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, ApiJson.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.user_id,
      first_name: user.first_name,
      last_name: user.last_name,
      books: Enum.map(user.books , fn(book) -> %{ book: book.book, editorial: book.editorial } end)
    }
  end
end
