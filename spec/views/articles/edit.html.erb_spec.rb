require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  let(:article) {
    Article.create!(
      status: 1,
      title: "MyString",
      author: nil,
      category: nil
    )
  }

  before(:each) do
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
