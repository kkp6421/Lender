class ApplicationController < ActionController::Base
  before_action :set_host
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404
  #rescue_from Exception, with: :error500

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end

  def error404
    render 'error/error404', status: 404, formats: [:html]
  end

  def error500
    render 'error/error500', status: 500, formats: [:html]
  end
end
