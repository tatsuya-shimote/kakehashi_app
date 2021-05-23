class Group < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :posts
end
