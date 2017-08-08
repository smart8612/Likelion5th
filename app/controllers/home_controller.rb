class HomeController < ApplicationController
  
  before_filter :authenticate_user!
  before_action :mylist
  
  $Current_Year = Date.current.year
  
  def friends
    
    @users = User.all
    @list = current_user.followees(User)
    
  end
  
  def home_login 
    
    @my_feeds = Post.where(user_id: current_user.id)
    @subscribe_feeds = Post.where(user_id: current_user.followees(User))
    @random_feeds = Post.where.not( user_id: current_user.id, user_id: current_user.followees(User)).shuffle
    
  end
  
  def home_logout
    
    redirect_to "/"
    
  end
  
  def profile
    
    @user_info = User.find(params[:user_id])
    @post_info = Post.where(user_id: params[:user_id])
    
  end

  def post_show
    
    @this_post = Post.find(params[:post_id])
    
  end
  
#<<mylist action start: Myounghee Seo
  def mylist_model
    
    #mylist의 model 데이터 대입 
      
    mylist = Mylist.new 
    mylist.goal = params[:goal]
    mylist.complete = params[:complete]
    
    if params[:now_year] == "true"
      
      mylist.year = $Current_Year
      
    end
    
    mylist.user_id = current_user.id
      
    mylist.save
    
    redirect_to "/mylist"
  end
  
  def mylist
    
    @mylist = Mylist.where(user_id: current_user.id) # => 현 세션의 mylist를 불러옴
    
    now_year_len = @mylist.where(year: $Current_Year).length # => 성취율의 분모
    now_year_achieve_len = @mylist.where(year: $Current_Year, complete: true).length
    
    $achivement_percent = now_year_achieve_len / now_year_len.to_f * 100 # 백분율 계산
    
  end
  
  def mylist_delete
  
    mylist = Mylist.find(params[:mylist_id])
    mylist.destroy
    
    redirect_to '/mylist'

  end
  
  def mylist_complete
  
    mylist = Mylist.find(params[:mylist_id])
    mylist.complete = params[:complete]
    mylist.save
    
    redirect_to '/mylist'
  end
  
  def myplan_model
    create_myplan = Myplan.new
    create_myplan.plan = params[:plan]
    create_myplan.mylist_id = params[:mylist_id]
    
    create_myplan.save
      
    redirect_to '/mylist'
  
  end
  
  def myplan_delete
    
    delete_myplan = Myplan.find(params[:myplan_id])
    delete_myplan.destroy
    
    redirect_to '/mylist'
  end
  
#>>mylist action end

#<<Post CRUD 액션 (Read 제외) : 한재원
  def write
    #@plan = Plan.new
    #@goals = Goal.alls
  end
  
  def create
    newPost = Post.new
    # newPost.mylist_complete = params[:mylist_complete] # 체크박스 변수입니다.
    # write 창과 mylist 창에서 둘 다 성취 가능하게 되면 모델을 어디에 맞춰야 할지 연구 중입니다
    newPost.title = params[:input_title]
    newPost.content = params[:input_content]
    newPost.editor = current_user.name
    newPost.user_id = current_user.id
    # newPost.grade = params[:input_grade]
    newPost.save
    redirect_to "/home_logout"
  end

  def post_update #송현: update_view에서 post_update로 수정되었습니다. comment_update와 혼동을 방지하기 위함입니다.
    @updatePost = Post.find_by_id(params[:id])
    # 목표 드롭다운 수정
    # 목표 성취 체크박스 수정
  end
  
  def post_update_a #post update action 입니다.
    updatePost = Post.find_by_id(params[:id])
  
    updatePost.title = params[:input_title]
    updatePost.content = params[:input_content]
    updatePost.grade = params[:input_grade]
    updatePost.save
    
    redirect_to :back
  end
  
  
  def destroy_view #이름 수정
    destroyPost = Post.all.find_by_id(params[:id])
    destroyPost.destroy
    redirect_to "/myprofile"
  end
  
  def year # 기본적으로 show와 비슷한 기능을 합니다.
    @post = Post.all.find_by_id(params[:id])
  end
#>>Post CRUD 액션 끝

end
