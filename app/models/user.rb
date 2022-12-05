# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  slug                   :string           default(""), not null
#  status                 :integer          default("active"), not null
#  type                   :string           default(""), not null
#  username               :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_status                (status)
#  index_users_on_type                  (type)
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  include SlugConcern

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  before_validation -> { set_slug(username) }, only: [:create, :update]

  validates :first_name, :last_name, :status, :type, :username, presence: true
  validates :slug, :username, uniqueness: true

  enum status: {
    active: 0,
    inactive: 1,
    banned: 2,
  }

  def super_admin?
    type == "SuperAdmin"
  end

  def admin?
    type == "Admin"
  end

  def author?
    type == "Author"
  end
end
