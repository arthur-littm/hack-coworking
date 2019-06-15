class LunchesController < ApplicationController
  def new
    @lunch = Lunch.new
  end

  def index
    @lunches = Lunch.all
    @users = User.all.select { |u| u.booking_today } - [ current_user ]
  end
end
