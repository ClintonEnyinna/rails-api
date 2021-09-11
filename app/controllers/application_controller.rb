class ApplicationController < ActionController::API
  DEFAULT_LIMIT = 20

  def default_limit
    params[:limit].presence || DEFAULT_LIMIT
  end
end
