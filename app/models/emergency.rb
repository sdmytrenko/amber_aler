# == Schema Information
#
# Table name: emergencies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Emergency < ApplicationRecord
  belongs_to :user # створюємо зв’язки один до багатьох
  has_many :messages, dependent: :destroy
  # validates :title, :description, presence: true
end
