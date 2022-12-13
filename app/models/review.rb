# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  decision        :integer
#  reviewable_type :string
#  status          :integer          default("waiting_review"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin_id        :bigint
#  reviewable_id   :bigint
#
# Indexes
#
#  index_reviews_on_admin_id         (admin_id)
#  index_reviews_on_decision         (decision)
#  index_reviews_on_reviewable       (reviewable_type,reviewable_id)
#  index_reviews_on_reviewable_type  (reviewable_type)
#  index_reviews_on_status           (status)
#
class Review < ApplicationRecord
  has_rich_text :comments

  belongs_to :reviewable, polymorphic: true
  belongs_to :admin, optional: true

  enum status: {
    waiting_review: 0,
    in_progress: 1,
    processed: 2,
  }

  enum decision: {
    accepted: 0,
    rejected: 1,
  }

  validates :status, presence: true
  validates :decision, presence: true, if: -> { processed? }
  validates :admin, presence: true, if: -> { in_progress? || processed? }
end
