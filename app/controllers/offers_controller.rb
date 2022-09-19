class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @offers = Offer.all
    # The `geocoded` scope filters only offers with coordinates
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude
      }
    end

    if params[:query].present?
      @offers = @offers.where("location ILIKE ?", "%#{params[:query]}%")
    end

    if params[:category].present?
      @offers = @offers.where(category: params[:category])
    end

  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
      if @offer.save
        redirect_to @offer, notice: "Offer was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def show
    @offer = Offer.find(params[:id])
    @markers = Array(@offer).map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        info_window: render_to_string(partial: "info_window", locals: {offer: offer})
      }
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path, notice: "Offer was successfully deleted."
  end

  private
  def offer_params
    params.require(:offer).permit(:title, :description, :hourly_rate, :location, :latitude, :longitude, :address, :photo, :category)
  end
end
