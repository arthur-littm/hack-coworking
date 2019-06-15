class RoomsController < ApplicationController
  def index
    # @rooms = Room.all.order(area_id: :desc)
    @areas = Area.all.sort_by { |area| area.rooms.length }.reverse
  end
end
