class Project < ApplicationRecord
  validates :title, presence: true
  validates :artType, presence: true
  validates :description, presence: true
  validates :featureImage, presence: true

  has_one_attached :featureImage
  belongs_to  :user, foreign_key: :user_id
end
