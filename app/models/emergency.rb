class Emergency < ActiveRecord::Base
	belongs_to :user # створюємо зв’язки один до багатьох
	validates :title, :description, presence: true
end
