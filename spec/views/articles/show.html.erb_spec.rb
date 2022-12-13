require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    assign(:article, Article.create!(
      status: 2,
      title: "title",
      author: nil,
      category: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/title/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
