class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  before_filter :configure_devise_permitted_parameters, if: :devise_controller?
  
  $Current_Year = Date.current.year
  
  def mylist
    
    @mylist = Mylist.where(user_id: current_user.id)
    
    @mylist_bar = @mylist.where(year: $Current_Year)
    
    now_year_len = @mylist_bar.length
    now_year_achieve_len = @mylist.where(year: $Current_Year, complete: true).length
    
    if now_year_len == 0 or now_year_achieve_len == 0
      $achivement_percent = 0
    else  
      temp = now_year_achieve_len / now_year_len.to_f * 100
      $achivement_percent = temp.to_int
    end
    
    
  end
  
  
  def ajax_json
    
    # @mylist = Mylist.where(user_id: current_user.id)
    
    # @mylist_bar = @mylist.where(year: $Current_Year)
    
    # now_year_len = @mylist_bar.length
    # now_year_achieve_len = @mylist.where(year: $Current_Year, complete: true).length
    
    # if now_year_len == 0 or now_year_achieve_len == 0
    #   $achivement_percent = 0
    # else  
    #   temp = now_year_achieve_len / now_year_len.to_f * 100
    #   $achivement_percent = temp.to_int
    # end
    
    render json: $achivement_percent, status: 200
    
  end

  protected

  def configure_devise_permitted_parameters
    permitted_params = [:email, :password, :password_confirmation, :name, :gender, :date_of_birth, :input_intro, :input_img]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) { 
        |u| u.permit(permitted_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) { 
        |u| u.permit(permitted_params) 
      }
    end
  end
  
end
