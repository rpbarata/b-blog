# frozen_string_literal: true

class ReviewResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :status, as: :select, enum: ::Review.statuses
  field :decision, as: :select, enum: ::Review.decisions, include_blank: "No decision"

  field :admin, as: :belongs_to
  field :reviewable, as: :belongs_to, polymorphic_as: :reviewable, types: [::Article]

  field :comments, as: :trix
end
