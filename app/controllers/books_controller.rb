class BooksController < ApplicationController
  def create
    @books = Book.all
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id

    if @new_book.save
      redirect_to book_path(@new_book), notice: 'created successfully'
    else
      @user = current_user
      render '/users/show'
    end
  end

  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])

    return redirect_to books_path if @book.user != current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'updated successfully'

    else
      @user = current_user
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'destroyed successfully'
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
