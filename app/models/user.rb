class User < ActiveRecord::Base
  has_many :rides
  has_many  :attractions, through: :rides

  validates :name, :password, :nausea, :happiness, :tickets, :height, presence: true
  validates :name, uniqueness: true

end
