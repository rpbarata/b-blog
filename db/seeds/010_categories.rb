# frozen_string_literal: true

Category.first_or_create!(
  [
    { name: "Cooking and recipes" },
    { name: "Beauty hacks" },
    { name: "Relationships" },
    { name: "Gardening" },
    { name: "Health and Fitness" },
    { name: "Lifestyle hacks" },
    { name: "Fashion and trends" },
    { name: "Mom’s blog" },
    { name: "Parenting" },
    { name: "Personal care" },
    { name: "Travel" },
    { name: "Food and reviews" },
    { name: "DIY &Crafts" },
    { name: "Home decors" },
    { name: "Finances (money-making)" },
    { name: "Men’s blog" },
  ],
)
