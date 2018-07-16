class UserController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!

  def profile
  end

  private
  def set_user
    @user = current_user
  end

end