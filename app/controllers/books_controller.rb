class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book.id), notice: 'You have created book successfully.'
    else
      # index.html.erbを表示させるために必要なインスタンス変数
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    # @book = Book.new
    @book_new = Book.new
    @user = current_user.id
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user.id
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :profile_image)
  end


end
