class Lunch < ApplicationRecord
  belongs_to :proposer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  def accept
    self.status = "accepted"
    save
  end

  def decline
    self.status = "declined"
    save
  end
end
