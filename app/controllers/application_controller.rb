class ApplicationController < ActionController::API
  DEFAULT_LIMIT = 20

  before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.new(request.headers).call

    render json: { error: 'Not authorized' }, status: :unauthorized unless @current_user
  end

  def default_limit
    params[:limit].presence || DEFAULT_LIMIT
  end
end
