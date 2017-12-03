class UserPanelController < ApplicationController

layout 'admin'

  before_action :authenticate_user!

  def index
  	@books = current_user.books.order('title ASC')
  end

end
