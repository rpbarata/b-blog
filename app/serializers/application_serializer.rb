# frozen_string_literal: true

class ApplicationSerializer
  # INCLUDES #
  include ActiveModel::AttributeAssignment

  # CLASS METHODS #
  class << self
    def call(record, attributes = {})
      new(record, attributes).call
    end

    def multi_call(records, attributes = {})
      records.collect { |r| new(r, attributes).call }
    end
  end

  # INSTANCE METHODS #
  def initialize(record, attributes)
    @record = record
    assign_attributes(attributes) if attributes.present?
  end

  def call
    raise NotImplementedError
  end
end
