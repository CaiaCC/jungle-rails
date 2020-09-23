class Review < ActiveRecord::Base
  belongs_to :product

	validates :product_id, presence: true
	validates :user_id, presence: true
	validates :description, presence: true, length: { minimum: 10 }
	validates :rating, presence: true, inclusion: { in: 1..5 }
end
