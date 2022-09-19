class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.offer = @offer

    if @appointment.save
      redirect_to user_path(current_user), notice: "Appointment was successfully booked."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @offer = Offer.find(params[:offer_id])
  end

  def update
    @offer = Offer.find(params[:offer_id])
    @appointment = Appointment.find(params[:id])
    @appointment.offer = @offer

    @appointment.accepted = true
    @appointment.save!
    redirect_to user_appointments_path(current_user)
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to user_appointments_path(current_user), status: :see_other
  end

  def index
    @appointments = Appointment.where(user_id: current_user.id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :hours)
  end
end
