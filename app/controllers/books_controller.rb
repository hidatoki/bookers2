class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(id: current_user)
  end

  def index
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @books = Book.all
  end

  def show
    @user = User.find_by(id: params[:user_id])
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end
  
  def book_params
    params.permit(:title, :body)
  end

end
