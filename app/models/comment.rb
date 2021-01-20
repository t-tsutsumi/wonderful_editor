class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  # validates :body, presence: true, length: { minimum: 1 }
  # validates :user_id, presence: true, uniqueness: true
  # validates :article_id, presence: true, uniqueness: true
end
