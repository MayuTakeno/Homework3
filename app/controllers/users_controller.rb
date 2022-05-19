class UsersController < ApplicationController
  before_action :correct_user, only: [:edit ]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      render :new_user_registration_path
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
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @book = @user
    @users = User.all
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(current_user.id)
    else
      render :edit
    end

  end

    private
      def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to user_path(current_user.id) unless @user == current_user
      end

end