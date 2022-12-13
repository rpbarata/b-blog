# frozen_string_literal: true

Admin.first_or_create!(
  Array.new(10) do
    {
      email: Faker::Internet.unique.email,
      first_name: Faker::Name.unique.first_name,
      last_name: Faker::Name.unique.last_name,
      username: "admin_#{Faker::Internet.unique.username}",
      password: "1234567",
    }
  end,
)

SuperAdmin.first_or_create!(
  {
    email: "superadmin@mail.com",
    first_name: "Super",
    last_name: "Admin",
    username: "superadmin",
    password: "1234567",
  },
)

Author.first_or_create!(
  Array.new(20) do
    {
      email: Faker::Internet.unique.email,
      first_name: Faker::Name.unique.first_name,
      last_name: Faker::Name.unique.last_name,
      username: Faker::Internet.unique.username,
      password: "1234567",
    }
  end,
)

require "open-uri"
User.find_each do |user|
  downloaded_image = URI.parse(Faker::Avatar.image(size: "50x50", format: "jpg")).open
  user.avatar.attach(io: downloaded_image, filename: "image.png")
end
