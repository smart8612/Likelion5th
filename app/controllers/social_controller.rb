class SocialController < ApplicationController
    
  def friends
    
    @users = User.all
    @list = current_user.followees(User)
    
  end
    
  def follow
        
    current_user.follow!(User.find(params[:user_id]))
        
    redirect_to :back
                
  end
    
  def unfollow
        
    current_user.unfollow!(User.find(params[:user_id]))
        
    redirect_to :back
        
  end
    
end
