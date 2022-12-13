# frozen_string_literal: true

require "rails_helper"

RSpec.describe("articles/edit") do
  let(:article) do
    Article.create!(
      status: 1,
      title: "MyString",
      author: nil,
      category: nil,
    )
  end

  before do
    assign(:article, article)
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(article), "post" do
      assert_select "input[name=?]", "article[status]"

      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[author_id]"

      assert_select "input[name=?]", "article[category_id]"
    end
  end
end
