class Admin < ApplicationRecord
    validates :email, presence: true
    validates :password, presence: true
    # has_one :user, as: :profile
end
