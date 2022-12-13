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
require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
