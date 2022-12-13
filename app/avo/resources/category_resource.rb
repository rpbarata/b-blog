# frozen_string_literal: true

class CategoryResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search_query = -> do
    params[:q].present? ? scope.pg_search(params[:q]) : scope
  end

  field :id, as: :id
  field :name, as: :text

  field :articles, as: :has_many
end
