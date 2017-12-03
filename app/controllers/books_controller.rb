class BooksController < ApplicationController

layout 'admin'

  before_action :authenticate_user!

  def index
  	@books = Book.order('title ASC')
  	@user_books = current_user.books.order('title ASC')
  end

  def new
  	@book = Book.new()
  	@category = Category.order('name ASC')
  end

  def create	
  	@book = current_user.books.new(book_params) # include current_user
    if @book.save
      flash[:notice] = "Book created."
      redirect_to new_book_path, :user_id => current_user.id
    else
    	flash[:alert] = @book.errors.full_messages.to_sentence
    	@book = Book.new()
    	@category = Category.order('name ASC')
      render('new')
    end

  end

  def edit
   @book = Book.find(params[:id])
   @category = Category.order('name ASC')
   
  end
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book updated."
      redirect_to books_path
    else
    	flash[:alert] = @book.errors.full_messages.to_sentence
    	@book = Book.find(params[:id])
    	@category = Category.order('name ASC')      
      render('edit')
    end
  end

  def destroy
  		book = Book.find(params[:id]).destroy
      flash[:notice] = "Book deleted."
      redirect_to(:action => 'index')
  end

private
  def book_params
    params.require(:book).permit(:title, :description, :pages, :user_id, :category_id, :text, :picture)
  end

  
end
