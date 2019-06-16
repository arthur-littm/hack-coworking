class LunchesController < ApplicationController
  before_action :set_lunch, only: [ :accept, :decline ]
  def create
    @lunch = Lunch.new
    @lunch.proposer = current_user
    @lunch.receiver = User.find(params[:receiver_id].to_i)
    if @lunch.save
      redirect_to user_account_path(current_user)
    else
      render :index, notice: "Oops, something went wrong!"
    end
  end

  def index
    @lunches = Lunch.all
    @users = User.all.select { |u| u.booking_today } - [ current_user ]
  end

  def accept
    @lunch.accept
  end

  def decline
    @lunch.decline
  end

  private

  def set_lunch
    @lunch = Lunch.find(params[:lunch_id])
  end

  def lunch_params
    params.require(:lunch).permit(:proposer_id, :receiver_id)
  end
end
