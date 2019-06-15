class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order(area_id: :desc)
  end
end
