class BookingDesksController < ApplicationController
  before_action :set_desk, only: [ :set_desk ]

  def create
    @booking_desk = BookingDesk.new(booking_desk_params)
    @booking_desk.user = current_user
    @booking_desk.desk = @desk
    if @booking_desk.save
      redirect_to "/"
    else
      render :new, notice: "Oops, something went wrong"
    end
  end

  private

  def set_desk
    @desk = params[:desk_id]
  end

  def booking_desk_params
    params.require(:booking_desk).permit(:starts_at, :ends_at)
  end
end