class ArticleResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search_query = -> do
    params[:q].present? ? scope.pg_search(params[:q]) : scope
  end

  field :id, as: :id
  field :title, as: :text
  field :status, as: :select, enum: ::Article.statuses
  field :header_image, as: :file, is_image: true, accept: "image/*"
  field :published_date, as: :date_time, time_24hr: true
  field :body, as: :trix
  
  field :author, as: :belongs_to
  field :category, as: :belongs_to
  field :reviews, as: :has_many, polymorphic_as: :reviewable
end
