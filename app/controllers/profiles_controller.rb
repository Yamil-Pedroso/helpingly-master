class ProfilesController < ApplicationController


  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to @profile, notice: "Profile was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to @profile, notice: "Profile was successfully updated."
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to root_path, notice: "Profile was successfully deleted."
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :email, :photo)
  end
end
