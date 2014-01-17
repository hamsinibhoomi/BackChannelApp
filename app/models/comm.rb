class Comm < ActiveRecord::Base
  attr_accessible :content, :post_id

  belongs_to :post
  validates :content, :presence => true
  validates :post_id, :presence => true
end
