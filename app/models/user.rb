class User < ActiveRecord::Base
  has_many :rides
  has_many  :attractions, through: :rides

  validates :name, :password, presence: true
  validates :name, uniqueness: true

  def mood
      happiness >= nausea ? "happy" : "sad"
  end

end
