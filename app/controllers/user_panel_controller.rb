class UserPanelController < ApplicationController
  def index
  	
  	@book = current_user.books.order('title ASC')
  end

  def new_book
  	@book = Book.new()
  	@category = Category.order('name ASC')
  end

  def create_book
  	@book = current_user.books.new(book_params) # include current_user
    if @book.save
      flash[:notice] = "Book created."
      redirect_to(:action => 'index')
    else
      render('new_book')
    end

  end

  def edit_book
   @book = Book.find(params[:id])
   @category = Category.order('name ASC')
   
  end
  def update_book
    @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
      flash[:notice] = "Book updated."
      redirect_to(:action => 'index')
      else
      
      render('edit_book')
      end
  end

  def delete_book
  		book = Book.find(params[:id]).destroy
      flash[:notice] = "Book deleted."
      redirect_to(:action => 'index')
  end

private
  def book_params
    params.require(:book).permit(:title, :description, :pages, :user_id, :category_id, :text, :picture)
  end



end
