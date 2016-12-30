# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  avatar                 :string
#  last_seen              :datetime
#  role                   :string           default("user")
#  active                 :boolean          default(TRUE)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  ROLES = ['user', 'admin']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  has_many :emergencies, dependent: :destroy # при видаленні юзера стирається все
  has_many :messages,    dependent: :destroy

  validates :name, presence: true, length: {minimum: 5}

  mount_uploader :avatar, AvatarUploader #uploader for avatar

  def display_name
    name.presence || "User ##{id}"
  end

  ROLES.each do |role_name| # метод для перевірки ролі користувача
    define_method "#{role_name}?" do
      self.role == role_name
    end
  end
end
