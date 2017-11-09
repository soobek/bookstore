class CategoriesController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!, :is_admin?

  def index
  	@category = Category.order('name ASC')
  end

  def new
    @category = Category.new()
  end

  def create
  	@category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
   @category = Category.find(params[:id])

  end
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = "Category updated."
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def destroy
  	category = Category.find(params[:id]).destroy
    flash[:notice] = "Category deleted."
    redirect_to(:action => 'index')
  end

 private
  def category_params
    params.require(:category).permit(:name)
  end

  def is_admin?
  	unless current_user.user_role == "admin"
  		flash[:alert] = "You don't have admin permition."
  		redirect_to :controller => "welcome", :action => "index"
  	end
  end

end
