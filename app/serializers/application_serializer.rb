# frozen_string_literal: true

class ApplicationSerializer
  # INCLUDES #
  include ActiveModel::AttributeAssignment

  # CLASS METHODS #
  def self.call(record, attributes = {})
    new(record, attributes).call
  end

  def self.multi_call(records, attributes = {})
    records.collect { |r| new(r, attributes).call }
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
