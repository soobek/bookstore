class WelcomeController < ApplicationController

layout 'admin'

  def index
      if params[:search]
        @books = Book.where("title like ? OR text like ? OR description like ?",
        "%"+params[:search]+"%", "%"+params[:search]+"%", "%"+params[:search]+"%")
      else
        @books = Book.order('title ASC')
      end
  end

  def show
    @book = Book.find(params[:id])
  end

end
