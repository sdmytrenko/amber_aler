class Emergency < ActiveRecord::Base
	belongs_to :user # створюємо зв’язки один до багатьох
end
