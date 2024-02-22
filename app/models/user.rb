class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable


  def self.from_omniauth(access_token)
    data = access_token.info
    
    authorized_user = AuthorizedUser.where(email: data['email']).first

    if authorized_user
      user = User.where(email: data['email']).first

      unless user
        user = User.create(#name: data['name'],
            email: data['email'],
            
          )
      end

    end
    
    
    puts "La data"   
    puts data
    
    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #    user = User.create(#name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    
    user
  end
end
