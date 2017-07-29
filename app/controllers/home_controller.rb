class HomeController < ApplicationController
  
  $Current_Year = Date.current.year
  
  def home_login
  end

  def home_logout
    redirect_to "/"
  end

  #내 피드 + 포스트 상세페이지 controller: 이송현
  def myprofile
    #내 피드에 모든 포스트 불러옴 / 최신순
    #수정필요: 사용자에 따라 내 피드와 친구들 피드를 구별하는 방식 연구
    
    @posts = Post.all
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
    
    @mylist = Mylist.where(user_id: current_user.id)
    
    @mylist.where(year: $Current_Year).length == 0
    @now_year_len = @mylist.where(year: $Current_Year).length
    $Data_k = 2/@now_year_len.to_f  * 100 # 백분율 계산
    
  end
  
  def mylist_delete
  
    mylist = Mylist.find(params[:mylist_id])
    mylist.destroy
    
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
    redirect_to "/myprofile"
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
  
  def post_feed # Random Feed용 Action, Created By Jeong Taek Han
    
    @random_posts = Post.all.sample(rand(1...Post.count))
    
  end
  
  def year # 기본적으로 show와 비슷한 기능을 합니다.
    @post = Post.all.find_by_id(params[:id])
  end
#>>Post CRUD 액션 끝

end
