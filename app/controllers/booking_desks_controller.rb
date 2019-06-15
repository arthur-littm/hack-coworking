class BookingDesksController < ApplicationController
  before_action :set_desk, only: [ :new, :create ]

  def new
    @booking_desk = BookingDesk.new
    @unavailabilities = @desk.unavailabilities
  end

  def create
    @booking_desk = BookingDesk.new(booking_desk_params)
    @booking_desk.user = current_user
    @booking_desk.desk = @desk
    if @booking_desk.save
      UnavailabilityDesk.create(starts_at: @booking_desk.starts_at, ends_at: @booking_desk.ends_at)
      redirect_to "/"
    else
      render :new, notice: "Oops, something went wrong"
    end
  end

  private

  def set_desk
    @desk = Desk.find(params[:desk_id].to_i)
  end

  def booking_desk_params
    params.require(:booking_desk).permit(:starts_at, :ends_at)
  end
end