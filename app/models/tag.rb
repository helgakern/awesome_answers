class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy 
    has_many :questions, through: :taggings
end
