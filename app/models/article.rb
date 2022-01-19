class Article < ApplicationRecord
    has_one_attached :image
    has_many :comments, dependent: :destroy
    validates :title,:description, presence: true,length: { minimum: 5 }
end
