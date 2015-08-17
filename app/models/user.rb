class User < ActiveRecord::Base
  ROLE_CONTRIBUTOR = 'contributor'.freeze
  ROLE_ADMIN       = 'admin'.freeze

  validates :name, :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Add relationships
  has_many :stories
end
