class Comment < ActiveRecord::Base
  attr_accessible :c_vote, :description, :post_id

  belongs_to :post


end
