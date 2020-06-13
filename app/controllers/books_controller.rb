class BooksController < ApplicationController
  def blogs
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
     if @book.save
      #サクセスメッセージ　@book, notice : ""の形はエラーが起きる
      flash[:notice] = 'Book was successfully created.'
      redirect_to @book
    else
      @books = Book.all
      render 'index'

    end
  end

  def edit
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)

  end

   def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
#サクセスメッセージを追加
    flash[:notice] = 'Book was successfully created.'
 end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end
