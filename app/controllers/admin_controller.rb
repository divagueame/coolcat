class AdminController < ApplicationController
    before_action :authenticate_user!

    before_action do 
        redirect_to :root unless is_admin?
    end



    def index
    end
  end
  