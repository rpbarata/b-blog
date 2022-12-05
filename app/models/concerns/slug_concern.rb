# frozen_string_literal: true

module SlugConcern
  extend ActiveSupport::Concern

  def to_param
    slug
  end

  def set_slug(attribute)
    if attribute.present?
      self.slug = attribute.to_s.parameterize
    end
  end
end
