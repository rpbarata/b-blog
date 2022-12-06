# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#  index_categories_on_slug  (slug) UNIQUE
#
class Category < ApplicationRecord
  include PgSearch::Model
  include SlugConcern

  before_validation -> { set_slug(name) }, only: [:create, :update]

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  pg_search_scope :pg_search,
    against: [:name],
    using: { tsearch: { prefix: true } },
    ignoring: :accents
end
