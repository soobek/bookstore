class WelcomeController < ApplicationController
  def index
    if params[:search]
      @books = Book.where("title like ?", "%"+params[:search]+"%")
    else
      @books = Book.order('title ASC')
    end
  end

  def search
    @books = Book.where("title like ?", params[:text])
  end
end
