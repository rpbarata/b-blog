# frozen_string_literal: true

class ApplicationPresenter
  # INCLUDES #
  include ActiveModel::AttributeAssignment

  # INSTANCE METHODS #
  def initialize(attributes = {})
    assign_attributes(attributes) if attributes.present?
  end
end
