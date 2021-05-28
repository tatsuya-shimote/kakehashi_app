class Group < ApplicationRecord
  validates :content, presence: true, length: {maximum: 200}
  validates :limit, presence: true
  validates :learning, presence: true
  belongs_to :user
  has_many :members
  has_many :posts ,dependent: :destroy
  has_many :member, through: :members, source: :user
end
