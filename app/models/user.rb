class User < ActiveRecord::Base
 validates :name,:presence=>true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name
  # attr_accessible :title, :body
 has_many :tweets
 has_many :relationships, foreign_key: "follower_id", dependent: :destroy
 has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
 has_many :followed_users, through: :relationships, source: :followed
 
 def to_param
  name
 end
  def following?(other_user)       
      return true unless self.relationships.where(followed_id: other_user.id).blank?
  end

  # def follow!(other_user)
    # self.relationships.create!(followed_id: other_user.id)
  # end

  def unfollow!(other_user)
    self.relationships.where(followed_id: other_user.id).destroy
  end
end
