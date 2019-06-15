class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :booking_rooms

  def current_balance
    balance ? balance : 0
  end

  def displayed_name
    name ? name : "Sebastien Saunier"
  end

  def displayed_job
    job ? job : "No listed job."
  end
end
