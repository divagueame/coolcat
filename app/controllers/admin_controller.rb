class AdminController < ApplicationController
before_action :admin_filter
        

def index
end



private

def admin_filter
    if is_admin?
        flash[:notice] = 'Admin Mode Activated'
    else
        flash[:alert] = 'No chiki chiki please...'
        redirect_to :root
    end
end 
            
end
