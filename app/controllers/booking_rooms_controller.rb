class BookingRoomsController < ApplicationController
  before_action :set_room, only: [ :create, :new ]

  def new
    # @room = Room.find(params[:room_id])
    @booking_room = BookingRoom.new
  end

  def create
    @booking_room = BookingRoom.new(booking_params)
    @booking_room.user = current_user
    @booking_room.room = @room
    if @booking_room.save
      redirect_to "/"
    else
      render :new, notice: "Something went wrong"
    end
  end


  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking_room).permit(:starts_at, :ends_at)
  end
end
