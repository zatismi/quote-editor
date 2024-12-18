module ApplicationHelper
  # helper_method :hello
  def hello
    "heloolololo!"
  end

  def bootstrap_class_for(flash_type)
    {
      "success" => "bg-success",
      "error"   => "bg-danger",
      "alert"   => "bg-warning",
      "notice"  => "bg-primary"
    }[flash_type] || "bg-secondary"
  end

  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def form_error_notification(object)
    if object.errors.any?
      tag.div class: "error-message" do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end
  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join("_")
  end

  def display_quote_info(label, quote, attribute, time_format = "%d.%m.%Y - %I:%M:%S %p")
    if quote.present?
      content_tag(:p) do
        content_tag(:strong, "#{label}: ") +
        quote.name + " " +
        content_tag(:strong, "#{attribute}: ") +
        (quote.send(attribute).strftime(time_format) if quote.respond_to?(attribute))
      end
    else
      content_tag(:p, "No #{label.downcase} available.")
    end
  end
end
