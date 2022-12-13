# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id             :bigint           not null, primary key
#  published_date :datetime
#  slug           :string           not null
#  status         :integer          default("draft"), not null
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :bigint           not null
#  category_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_author_id    (author_id)
#  index_articles_on_category_id  (category_id)
#  index_articles_on_slug         (slug) UNIQUE
#  index_articles_on_title        (title) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Article < ApplicationRecord
  include SlugConcern
  include PgSearch::Model

  belongs_to :author, optional: false
  belongs_to :category, optional: false

  has_many :reviews, as: :reviewable, dependent: :nullify

  has_rich_text :body
  has_rich_text :header
  has_one_attached :header_image

  before_validation -> { set_slug(title) }, only: [:create, :update]

  validates :slug, :title, presence: true, uniqueness: true
  validates :status, presence: true

  after_save :create_initial_review, if: -> { waiting_review? }

  enum status: {
    draft: 0,
    waiting_review: 1,
    in_review: 2,
    published: 3,
    rejected: 4,
  }

  pg_search_scope :pg_search,
    against: [:id, :title],
    using: { tsearch: { prefix: true } },
    ignoring: :accents

  private

  def create_initial_review
    if saved_change_to_attribute("status")[0] == "draft"
      Review.create!(
        decision: nil,
        status: :waiting_review,
        admin: nil,
        reviewable: self,
      )
    end
  end
end
