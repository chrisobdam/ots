class Api::UsersController < ApplicationController
  def show
    @user = User.find_by! :identifier => params["id"]
  end
end
