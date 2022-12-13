require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      status: 1,
      title: "MyString",
      author: nil,
      category: nil
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input[name=?]", "article[status]"

      assert_select "input[name=?]", "article[title]"

      assert_select "input[name=?]", "article[author_id]"

      assert_select "input[name=?]", "article[category_id]"
    end
  end
end
