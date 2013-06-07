class Board < ActiveRecord::Base
  has_many :posts
  attr_accessible :name
  scope :recent, :order => "updated_at DESC"
end
