class BooksController < ApplicationController

  def new
  end

  def create
  end

  def index
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
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

end
