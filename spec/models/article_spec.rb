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
require 'rails_helper'

RSpec.describe Article, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
