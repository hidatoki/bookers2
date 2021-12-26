class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  end

  def index
    @user = current_user
    @book = current_user
    @book_new = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
       render "edit"
    else
       redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def  ensure_current_user
    @book = Book.find(params[:id])
     if @book.user_id != current_user.id
        redirect_to books_path
     end
  end

end
