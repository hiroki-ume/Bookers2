class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	class << self
		def search(query)
			rel = order('id')
			if query.present?
				rel = rel.where("title LIKE?", "%#{query}%")
			end
		rel
		end
	end
end
