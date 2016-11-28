# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  emergency_id :integer
#  text         :text
#  claim_closed :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_messages_on_emergency_id  (emergency_id)
#  index_messages_on_user_id       (user_id)
#

class Message < ApplicationRecord
  # belongs_to :user
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :emergency
end
