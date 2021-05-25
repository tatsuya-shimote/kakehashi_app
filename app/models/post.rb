class Post < ApplicationRecord
  validates :message, presence: true, length: {maximum: 200}
  belongs_to :user
  belongs_to :group
end
