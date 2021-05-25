class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :posts ,dependent: :destroy
  has_many :member, through: :members, source: :user
end
