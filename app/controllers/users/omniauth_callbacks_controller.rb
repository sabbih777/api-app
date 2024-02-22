class Users::OmniauthCallbacksController < ApplicationController
  skip_before_action :authenticate_request , only: [:google]

    def google
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.from_omniauth(request.env['omniauth.auth'])
  
      if @user==nil 
        puts "Unauthorized user"
        render json: { error: 'Invalid username or password'}, status: :unauthorized
      
      else
        puts "AUTHORIZED"
        token = jwt_encode(user_id:@user.id)
        render json: { token: token} , status: :ok
      end
      


        #if @user.persisted?
        #  flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        #  sign_in_and_redirect @user, event: :authentication
          
          

          
        #else
        #  session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        #  redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")


        #end
    end

    def failure
      #  redirect_to root_path
    end
end
