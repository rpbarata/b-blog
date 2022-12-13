# frozen_string_literal: true

Article.first_or_create!(
  Array.new(10) do
    {
      title: Faker::Lorem.sentence,
      author_id: Author.ids.sample,
      category_id: Category.ids.sample,
      body: Faker::Lorem.paragraphs(number: 5),
      header: Faker::Lorem.paragraphs(number: 2),
      status: ::Article.statuses.keys.sample.to_sym,
    }
  end,
)

require 'open-uri'
Article.find_each do |article|
  published_date = article.published? ? Faker::Time.between(from: 14.days.ago, to: Time.now) : nil
  downloaded_image = URI.parse(Faker::LoremFlickr.image).open

  article.header_image.attach(io: downloaded_image, filename: "image.png")
  article.update(published_date: published_date)
end
