class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format:{with:VALID_EMAIL_REGEX},
            uniqueness: true
  validates :content, length: {maximum: 200}
  has_secure_password
  
  has_many :groups
  has_many :members
  has_many :posts
  has_many :group ,through: :members, source: :group #これいるのか？
  
  
  def join(will_join_group)
    unless self.members.find_by(group_id: will_join_group)
      self.members.find_or_create_by(group_id: will_join_group.id)
    end
  end
  
  def exit(join_group)
    grp = self.members.find_by(group_id: join_group.id)
    grp.destroy if grp
  end
end
