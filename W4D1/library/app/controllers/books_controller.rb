require 'byebug'
class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.save!
    redirect_to books_url
  end

  def destroy
    book = Book.find_by(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
