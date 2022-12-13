# frozen_string_literal: true

class SuperAdminResource < Avo::BaseResource
  self.title = :username
  self.includes = []
  self.model_class = ::SuperAdmin
  # self.resolve_find_scope = ->(model_class:) do
  # end
  self.search_query = -> do
    params[:q].present? ? scope.pg_search(params[:q]) : scope
  end

  field :avatar, as: :file, is_image: true, accept: "image/*"
  field :id, as: :id
  field :email, as: :text
  field :first_name, as: :text
  field :last_name, as: :text
  field :username, as: :text
  field :status, as: :select, enum: ::User.statuses
  # field :slug, as: :text
  field :type, as: :select, options: { "Author": "Author", "Admin": "Admin", "Super admin": :SuperAdmin }

  filter UsersStatusFilter
end
