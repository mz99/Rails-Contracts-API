class ApplicationController < ActionController::API
  include TokenAuthenticatable
  include AdminAuthorizable
  #protect_from_forgery with: :null_session

  rescue_from ActiveRecord::RecordNotFound, with: -> { render json: { error: 'Not found' }, status: :not_found }
end
