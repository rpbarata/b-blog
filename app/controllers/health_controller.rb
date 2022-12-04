# frozen_string_literal: true

class HealthController < ActionController::Metal
  include AbstractController::Rendering
  include ActionController::Rendering
  include ActionController::Renderers::All
  include ActionController::Rescue

  def health
    render(json: "OK", status: :ok)
  end
end
