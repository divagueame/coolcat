class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def is_admin?
        current_user && current_user.admin?
    end


    
    protected
    
      def after_sign_in_path_for(resource)
        if(is_admin?) then
          admin_path
        else
          cats_path
        end
      end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    end

end
