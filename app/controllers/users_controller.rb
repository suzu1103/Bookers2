class UsersController < ApplicationController
  def index
    @users = User.all
    # @books = Book.new
    @book_new = Book.new
  end

  def show
    @user = User.find(params[:id])
    # @book = Book.new
    @book_new = Book.new
    @books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private
  def user_params
    params.require(:user).permit(:title, :introduction, :profile_image)
  end

end
