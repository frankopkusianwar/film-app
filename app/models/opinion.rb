class Opinion < ApplicationRecord
  validates :Text, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes

  has_one_attached :clip
  has_one_attached :image
  has_one_attached :video
  has_one_attached :file
  default_scope { order('created_at DESC') }
  # validates :image, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/gif'] }, if: -> { image.attached? }


end
