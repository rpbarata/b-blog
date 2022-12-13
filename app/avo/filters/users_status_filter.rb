# frozen_string_literal: true

class UsersStatusFilter < Avo::Filters::SelectFilter
  self.name = "Users status filter"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, value)
    query.public_send(value)
  end

  def options
    options = {}
    User.statuses.each do |k, _v|
      options[k] = k
    end

    options
  end
end
