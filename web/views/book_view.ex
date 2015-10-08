defmodule ApiJson.BookView do
  use ApiJson.Web, :view

  def render("index.json", %{books: books}) do
    %{data: render_many(books, ApiJson.BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, ApiJson.BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{id: book.book_id,
      book: book.book,
      editorial: book.editorial,
      user_id: book.user_id}
  end
end
