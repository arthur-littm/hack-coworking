class Area < ActiveRecord::Base
  validates :name, presence: true

  has_many :area_tags
  has_many :tags, through: :area_tags
end
