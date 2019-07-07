class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         mount_uploader :icon, ImageUploader
         
         has_many :messages, :dependent => :destroy
         has_many :entries, :dependent => :destroy
         has_many :posts, :dependent => :destroy
         has_many :evaluations, :dependent => :destroy
         has_many :boards, :dependent => :destroy
         has_many :comments, :dependent => :destroy
         has_many :unreads, :dependent => :destroy
         
         has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

         has_many :followings, through: :following_relationships
        
         has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
        
         has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
         
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
