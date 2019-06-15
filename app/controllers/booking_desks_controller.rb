class BookingDesksController < ApplicationController
  before_action :set_desk, only: [ :new, :create ]
  before_action :set_booking_desk, only: [ :show ]

  def show

  end

  def new
    @booking_desk = BookingDesk.new
    @unavailabilities = @desk.unavailability_desks
  end

  def create
    @booking_desk = BookingDesk.new(booking_desk_params)
    @booking_desk.user = current_user
    @booking_desk.desk = @desk
    if @booking_desk.save
      UnavailabilityDesk.create(starts_at: @booking_desk.starts_at, ends_at: @booking_desk.ends_at, desk: @booking_desk.desk)
      redirect_to "/"
    else
      render :new, notice: "Oops, something went wrong"
    end
  end

  private

  def set_booking_desk
    @booking_desk = BookingDesk.find(params[:id])
  end

  def set_desk
    @desk = Desk.find(params[:desk_id].to_i)
  end

  def booking_desk_params
    params.require(:booking_desk).permit(:starts_at, :ends_at)
  end
end