class Post < ActiveRecord::Base
  attr_accessible :description, :votes, :category_id, :category, :created_at, :updated_at, :title, :tag , :recentness
  belongs_to :category
  has_many :post_votes
  has_many :comms


end
