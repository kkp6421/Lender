class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404
  rescue_from Exception, with: :error500

  def error404
    render 'error/error404', status: 404, formats: [:html]
  end

  def error500
    render 'error/error500', status: 500, formats: [:html]
  end
end
