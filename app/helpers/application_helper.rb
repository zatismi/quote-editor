module ApplicationHelper
  # helper_method :hello
  def hello
    "heloolololo!"
  end

  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end
end
