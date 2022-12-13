json.extract! article, :id, :status, :title, :published_date, :author_id, :category_id, :created_at, :updated_at
json.url article_url(article, format: :json)
