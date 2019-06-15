class RoomsController < ApplicationController
  def index
    # @rooms = Room.all.order(area_id: :desc)
    @areas = Area.all
  end
end
