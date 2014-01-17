class User < ActiveRecord::Base
  attr_accessible :name, :password, :unityid, :admin, :deleted
  has_many :posts
  has_many :post_votes



  def User.authenticate (id,password)
    user=find_by_unityid(id)

    if user
      pwd = user.password
      if password==pwd
        user
      end
    end
  end

end
