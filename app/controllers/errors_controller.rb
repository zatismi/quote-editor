class ErrorsController < ApplicationController
  def bad_request
    render html: Rails.root.join("public/400.html").read.html_safe
  end

  def unprocessable_entity
    render html: Rails.root.join("public/422.html").read.html_safe
  end

  def internal_server_error
    render html: Rails.root.join("public/500.html").read.html_safe
  end

  def not_found
    render html: Rails.root.join("public/404.html").read.html_safe
  end

  # def not_found
  #   render template: "errors/404", status: :not_found
  # end
end
