class UsersController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :books_path
    end
  end
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @book = @user
    @users = User.all
    if @user.update(user_params)
      redirect_to books_path
    else
      render :index
    end

  end

    private
      def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
      end
end