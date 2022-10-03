class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @user = current_user
    @users = User.all
 end

 def dashboard
    @user = current_user
 end

 def profile
    @user = current_user
 end

 def settings
    @user = current_user
 end

 def edit_user
    @user = current_user
 end
end
