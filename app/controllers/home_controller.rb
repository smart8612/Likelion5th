class HomeController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :mylist
  before_action :friends
  
  def friends
    
    @users = User.all
    @list = current_user.followees(User)
    
  end
  
  def home_login 
    
    subscribe_feeds = Post.where(user_id: current_user.followees(User)).order(:created_at).reverse
    my_feeds = Post.where(user_id: current_user.id).order(:created_at).reverse
    
    temp = subscribe_feeds + my_feeds
    @all_feeds = temp
    
    @random_feeds = Post.where.not(user_id: current_user.id).where.not(user_id: current_user.followees(User)).shuffle
    
  end
  
  def home_logout
    
    @random_feeds = Post.all.shuffle
    
  end
  
  def profile
    
    @user_info = User.find(params[:user_id])
    @post_info = Post.where(user_id: params[:user_id])
    
  end
  
  def post_show
    
    @this_post = Post.find(params[:post_id])
    # @user_info = User.find(params[:user_id])
    
  end

#<<Post CRUD 액션 (Read 제외) : 한재원
  def write
  
  end
  
  def create
    newPost = Post.new

    if params[:input_title] == ""
      newPost.title = params[:mylist_dropdown]
    else
      newPost.title = params[:input_title]
    end
    
    if params[:mylist_dropdown] == "새로운 목표가 제목으로 들어갑니다"
      newGoal = Mylist.new
      newGoal.goal = params[:input_new_goal]
      newGoal.user_id = current_user.id
      newPost.title = params[:input_new_goal]
      
      newGoal.save
    end

    newPost.content = params[:input_content]
    newPost.editor = current_user.name
    newPost.user_id = current_user.id
    newPost.grade = params[:input_grade]
    newPost.year = params[:p_year]
    newPost.month = params[:p_month]
    newPost.day = params[:p_day]
    
    uploader = PostimageUploader.new

    uploader.store!(params[:imageFile])
    
    newPost.img = uploader
    
    newPost.save
    
    redirect_to '/'
  end

  def post_update #송현: update_view에서 post_update로 수정되었습니다. comment_update와 혼동을 방지하기 위함입니다.
    @updatePost = Post.find(params[:post_id])

    # 목표 드롭다운 수정
    # 목표 성취 체크박스 수정
  end
  
  def post_update_a #post update action 입니다.
    
    updatePost = Post.find_by_id(params[:id])
    updatePost.goal
    updatePost.title = params[:input_title]
    updatePost.content = params[:input_content]
    updatePost.grade = params[:input_grade]
    updatePost.save
    
    redirect_to :back
  end
  
  
  def destroy_view #이름 수정
    destroyPost = Post.find(params[:post_id])
    destroyPost.destroy
    
    redirect_to '/'
  end
  
   def year
    @user = User.find_by_id(params[:user_id])
    @post_u = Post.where(user_id: params[:user_id])
    @year_a = @post_u.select(:year).map(&:year).sort.reverse
  end
  
  def to_year
    @input_year = params[:select_year]
    @post = Post.where("user_id = ? AND year = ?", params[:user_id], params[:select_year])
    render :json => {
      :post => @post
    }
  end


end
