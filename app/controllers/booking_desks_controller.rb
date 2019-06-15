class BookingDesksController < ApplicationController
  # before_action :set_desk, only: [ :new, :create ]
  before_action :set_booking_desk, only: [ :show, :update, :edit ]

  def show

  end

  def new
    @booking_desk = BookingDesk.new
    # @unavailabilities = @desk.unavailability_desks
  end

  def edit
  end

  def update
    # todo save the preference on who he wants to sit next to
    redirect_to booking_desk_path(@booking_desk)
  end

  def create
    raise
    @booking_desk = BookingDesk.new(starts_at: Date.today, ends_at: Date.today + 1)
    @booking_desk.user = current_user
    @booking_desk.price = params[:booking_desk][:price].to_f
    if @booking_desk.save
      tags = params[:booking_desk][:booking_desk_tags][:tag].select {|t| t.present?}
      if tags.any?
        tags.each {|t| BookingDeskTag.create(tag_id: t, booking_desk: @booking_desk)}
      end
      # TODO (arthur-littm) make this work with the selected tags that match with the desk
      @booking_desk.desk = Desk.all.sample
      @booking_desk.save
      UnavailabilityDesk.create(starts_at: @booking_desk.starts_at, ends_at: @booking_desk.ends_at, desk: @booking_desk.desk)
      redirect_to edit_booking_desk_path(@booking_desk)
    else
      render :new, notice: "Oops, something went wrong"
    end
  end

  private

  def set_booking_desk
    @booking_desk = BookingDesk.find(params[:id])
  end

  def set_desk
    @desk = Desk.find(params[:desk_id].to_i)
  end

  def booking_desk_params
    params.require(:booking_desk).permit(:starts_at, :ends_at, :price)
  end
end
