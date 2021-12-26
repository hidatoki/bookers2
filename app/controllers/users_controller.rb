class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book_new = Book.new
    @book = current_user
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
    @book = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
       render "edit"
    else
       redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :body)
  end

  def ensure_current_user
    @user = User.find(params[:id])
     if @user.id != current_user.id
        redirect_to user_path(current_user.id)
     end
  end
  
end