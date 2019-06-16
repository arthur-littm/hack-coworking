class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @lunches = Lunch.where(receiver_id: @user.id).select { |lunch| lunch.status == "pending"}
    @lunch_resquests = Lunch.where(proposer_id: current_user)
  end

  def admin

  end
end
