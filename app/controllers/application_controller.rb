class ApplicationController < ActionController::Base

include JsonWebToken
before_action :authenticate_request
#skip_before_action :verify_authenticity_token
protect_from_forgery prepend: true

private

    def authenticate_request
        header = request.headers('Authorization')
        header = header.split(' ').last if header
        decoded = jwt_decode(header)
        @current_user = User.find(decoded[:user_id])
    end


end
