class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request , only: [:login]
    
    def login
        #Authenticate against Google
        redirect_to  user_google_omniauth_authorize_path            
      #  @user = User.find_by_email('xdyerm@gmail.com')
      #  token = jwt_encode(user_id:@user.id)
      #  render json: { token: token} , status: :ok
    
    #    render json: { error: 'Invalid username or password'}, status: :unauthorized
    end
end
