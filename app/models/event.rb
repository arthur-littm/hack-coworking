class Event < ApplicationRecord
  # mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates :starts_at, presence: true
  validates :ends_at, presence: true
end
