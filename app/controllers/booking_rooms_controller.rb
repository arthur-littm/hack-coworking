class BookingRoomsController < ApplicationController
  before_action :set_room, only: [ :create, :new ]

  def show

  end

  def new
    # @room = Room.find(params[:room_id])
    @booking_room = BookingRoom.new
    @unavailabilities = @room.unavailability_rooms
  end

  def create
    @booking_room = BookingRoom.new(booking_params)
    @booking_room.user = current_user
    @booking_room.room = @room
    if @booking_room.save
      UnavailabilityRoom.create(starts_at: @booking_room.starts_at, ends_at: @booking_room.ends_at, room: @room)
      redirect_to booking_room_path(@booking_room)
    else
      render :new, notice: "Something went wrong"
    end
  end


  private

  def set_room
    @room = Room.find(params[:room_id].to_i)
  end

  def booking_params
    params.require(:booking_room).permit(:starts_at, :ends_at)
  end
end
