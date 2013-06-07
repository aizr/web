class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :board, :counter_cache => true
  attr_accessible :content, :title, :image
  scope :recent, :order => 'updated_at DESC'
  has_attached_file :image, :styles => { :show => "640X480>", :thumb => "100X100#" }
end
