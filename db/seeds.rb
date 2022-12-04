# frozen_string_literal: true

return unless Rails.env.development?

# Faker::Config.locale = 'pt'

ActiveRecord::Base.transaction do
  Dir[Rails.root.join("db/seeds/*.rb")].sort.each { |file| require file }
end
