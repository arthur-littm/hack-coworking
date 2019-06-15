class DesksController < ApplicationController
  before_action :set_desk

  def show
  end

  private

  def set_desk
    @desk = Desk.find(params[:id])
  end
end