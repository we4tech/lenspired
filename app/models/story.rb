class Story < ActiveRecord::Base
  STATUS_ACTIVE   = 1
  STATUS_INACTIVE = 0
  STATUS_PENDING  = 2

  validates :title, :description, presence: true
  validates_length_of :title, maximum: 255, minimum: 2

  # Add attachments
  attachment :image

  # Make it taggable
  acts_as_taggable_on :tags

  # Setup relationships
  belongs_to :user

  # Add common query scopes
  scope :active, -> { where(status: STATUS_ACTIVE) }
  scope :pending, -> { where(status: STATUS_PENDING) }
end
