class UserPanelController < ApplicationController

layout "user"

  def index
  	@books = current_user.books.order('title ASC')
  end

end
