class SocialController < ApplicationController
  
  before_action :mylist
  
  def mylist
    
    @mylist = Mylist.where(user_id: User.find(params[:user_id]).id)
    
    @mylist_bar = @mylist.where(year: $Current_Year).order(:created_at).reverse
    
    now_year_len = @mylist_bar.length
    now_year_achieve_len = @mylist.where(year: $Current_Year, complete: true).length
    
    if now_year_len == 0 or now_year_achieve_len == 0
      $achivement_percent = 0
    else  
      temp = now_year_achieve_len / now_year_len.to_f * 100
      $achivement_percent = temp.to_int
    end
    
    @users = User.all
    @list = current_user.followees(User)
    
  end
  
  def friends
    
    @users = User.all
    @list = current_user.followees(User)
    
    
  end
  
  def profile
    
    @user_info = User.find(params[:user_id])
    @post_info = Post.where(user_id: params[:user_id])
    
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
