# frozen_string_literal: true

class ApplicationService
  # INCLUDES #
  include ActiveModel::AttributeAssignment

  # CLASS METHODS #
  class << self
    def call(attributes = {}, &block)
      new(attributes).call(&block)
    end
  end

  # INSTANCE METHODS #
  def initialize(attributes)
    assign_attributes(attributes) if attributes.present?
  end

  def call
    raise NotImplementedError
  end
end
