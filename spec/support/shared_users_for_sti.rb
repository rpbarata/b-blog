# frozen_string_literal: true

require "spec_helper"

RSpec.shared_examples("a user") do
  it "has attribute type" do
    # expect(subject).to(have_attribute(:type))
  end

  it "initializes successfully as an instance of the described class" do
    # expect(subject).to(be_a(described_class))
  end

  it "is valid with valid attributes" do
    # expect(described_class).to(be_valid)
  end

  it "is not valid without email"
  it "is not valid without first_name"
  it "is not valid without last_name"
  it "is not valid without slug"
  it "is not valid without status"
  # it "is not valid without type"
  it "is not valid without username"
end
