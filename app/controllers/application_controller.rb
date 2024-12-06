class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  private

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end

  helper_method :current_company
  # TODO: we might not need allow_browser... anymore, but I am not sure yet
  # FIXME: we might not need allow_browser... anymore, but I am not sure yet
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  # To test the Progress Bar style, we use the next line for delay that let us see it
  # before_action -> { sleep 3 }
end
