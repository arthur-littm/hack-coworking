class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :booking_desks
  has_many :desks, through: :booking_desks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :booking_rooms
  has_many :proposed_lunches,  foreign_key: :proposer_id, class_name: 'Lunch'
  has_many :receiver_lunches,  foreign_key: :recceiver_id, class_name: 'Lunch'
  has_many :receivers, through: :proposed_lunches

  def current_balance
    balance ? balance : 0
  end

  def displayed_name
    name ? name : "Sebastien Saunier"
  end

  def displayed_job
    job ? job : "No listed job."
  end

  def booking_today
    self.booking_desks.find { |booking| booking.starts_at == Date.today }
  end
end
