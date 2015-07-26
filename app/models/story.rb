class Story < ActiveRecord::Base
  validates :title, :description, presence: true
  validates_length_of :title, maximum: 255, minimum: 2
end
