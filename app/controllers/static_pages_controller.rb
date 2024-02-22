class StaticPagesController < ApplicationController
  skip_before_action :authenticate_request , only: [:home]
 

  def home
  end
end
