class Post < ApplicationRecord
	has_many :comments
	validates :title, length: { maximum: 140 },  presence: true
	validates :content, presence: true
end
