class SocialController < ApplicationController
  
  before_action :mylist
    
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
  
  def profile_intro
    
    @user_info = User.find(params[:user_id])
    
  end
  
  def intro_edit
    @user_info = User.find(params[:user_id])
    
    @user_info.profile_intro = params[:input_intro]
    
    @user_info.save
    
    redirect_to "/profile/#{current_user.id}"
  end
  
  def img_edit
    
    @user_info = User.find(params[:user_id])
    
    
    
    uploader = ProfileUploader.new

    uploader.store!(params[:input_file])
    
    @user_info.profile_img = uploader
    
    @user_info.save
    
    redirect_to "/profile/#{current_user.id}"
    
  end
  
  def profile_img
    
  end
    
end
