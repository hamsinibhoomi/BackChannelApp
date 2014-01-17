class PostVote < ActiveRecord::Base
  attr_accessible :post_id
  belongs_to :post
  belongs_to :user
end
