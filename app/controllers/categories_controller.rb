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
      redirect_to categories_path
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
      redirect_to categories_path
    else  
      flash[:notice] = "Faild to edit category."
      redirect_to categories_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Category deleted."
      redirect_to categories_path
    else
      flash[:notice] = "Faild to delete category."
      redirect_to categories_path
    end
  end

 private
  def category_params
    params.require(:category).permit(:name)
  end

  def is_admin?
    unless current_user.user_role == "admin"
      flash[:alert] = "You don't have admin permition."
      redirect_to root_path 
    end
  end

end
