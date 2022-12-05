# frozen_string_literal: true

ActionView::Base.field_error_proc = proc do |html_tag, instance|
  html = ""

  form_fields = [
    "textarea",
    "input",
    "select",
  ]

  elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css("label, " + form_fields.join(", "))

  elements.each do |e|
    if e.node_name.eql?("label")
      html = %(#{e}).html_safe
    elsif form_fields.include?(e.node_name)
      e["class"] += " is-invalid"
      html = if instance.error_message.is_a?(Array)
        %(#{e}<div class="invalid-feedback text-start mb-2">#{instance.error_message.uniq.map(&:capitalize).join(", ")}</div>).html_safe
      else
        %(#{e}<div class="invalid-feedback text-start mb-2">#{instance.error_message.capitalize}</div>).html_safe
      end
    end
  end
  html
end
