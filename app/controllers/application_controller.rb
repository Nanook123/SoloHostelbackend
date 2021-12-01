class ApplicationController < ActionController::API
    include ActionController::Cookies

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

before_action :authorize

private

def authorize
    @current_user = User.find_by(id: session[:user_id])

    render json: {errors: ["Not Authorized"]}, status: :unauthorized unless @current_user
end

def render_not_found_response
    render json: {errors: ["Not Found"]}, status: :not_found
end
def render_unprocessable_entity(exception)
    render json: {errors: exception.record.erros.full_messages}, status: :unprocessable_entity

end

end