class UsersController < ApplicationController
  def show
    unless current_user.sign_in_count > 1
      flash[:notice] = "Signed up successfully and logging in for the first time"
    end
  end
end
