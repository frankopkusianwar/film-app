class Opinion < ApplicationRecord
  validates :Text, presence: true
  belongs_to :user
  has_many :comments

  has_one_attached :clip
  default_scope { order('created_at DESC') }
end
