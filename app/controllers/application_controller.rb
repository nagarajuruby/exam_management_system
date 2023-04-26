class ApplicationController < ActionController::API
  after_action :log_request

  rescue_from Exception, with: :render_error_response

  private

  def log_request
    ApiRequest.create(
      verb: request.method,
      path: request.path,
      status: response.status
    )
  end

  def render_error_response(exception)
    logger.error(exception)
    render json: { error: 'Internal Server Error' }, status: :internal_server_error
  end
end
