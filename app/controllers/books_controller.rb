class BooksController < ApplicationController
  layout :layout_check

  def index
    @books = Book.order('title ASC')
    @user_books = current_user.books.order('title ASC')
  end

  def new
    @book = Book.new()
  end

  def create
    @book = current_user.books.new(book_params) # include current_user
    if @book.save
      flash[:notice] = "Book created."
      redirect_to books_path
    else
      flash[:alert] = @book.errors.full_messages.to_sentence
      render('new')
    end
  end

  def edit
   @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Book updated."
      redirect_to books_path
    else
      flash[:alert] = @book.errors.full_messages.to_sentence
      render('edit')
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book deleted."
    else
      flash[:notice] = "Book deleted."
    end
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(
      :title,
      :description,
      :pages,
      :user_id,
      :category_id,
      :text,
      :picture
    )
  end

	def layout_check
		if current_user.admin?
			"admin"
		else
			"user"
		end
	end
end
