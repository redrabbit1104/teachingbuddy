class BoardsController < ApplicationController
  def index
  	@users = User.all
  end
end
