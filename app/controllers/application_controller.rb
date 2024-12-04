class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # To test the Progress Bar style, we use the next line for delay that let us see it
  # before_action -> { sleep 3 }
end
