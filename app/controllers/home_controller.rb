class HomeController < ApplicationController
  def home_login
  end

  def home_logout
  end

  def write
  end

  def myprofile
    #내 피드에 모든 포스트 불러옴 / 최신순
    #수정필요: 사용자에 따라 내 피드와 친구들 피드를 구별하는 방식 연구
    @posts = Post.all.reverse
  end

  def post_show
    #각 post id로 불러옴 
    @this_post = Post.find(params[:id])
    
    #모든 댓글 불러옴
    @comments = Comment.all
  end
  #mylist controller action start: Myounghee Seo
  def mylist_model
    
    #mylist의 model 데이터 대입 
      
    mylist = Mylist.new 
    mylist.goal = params[:goal]
    mylist.complete = params[:complete]
      
    mylist.save
    
    redirect_to "/mylist"
  end
  
  def mylist
    
    @mylist = Mylist.all
    
  end
  
  def mylist_delete
  
    mylist = Mylist.find(params[:mylist_id])
    mylist.destroy
    
    redirect_to '/mylist'
    
  end
#mylist action end

# Post CRUD 액션 (Read 제외) : 한재원
  def write
  end
  
  def create
    # @posts = Post.all # 드롭다운 메뉴에 쓰는 걸 연구 중입니다
    newPost = Post.new
    # newPost.mylist_complete = params[:mylist_complete] # 체크박스 변수입니다.
    # write 창과 mylist 창에서 둘 다 성취 가능하게 되면 모델을 어디에 맞춰야 할지 연구 중입니다
    newPost.title = params[:input_title]
    newPost.content = params[:input_content]
    newPost.grade = params[:input_grade]
    newPost.save
    redirect_to "/myprofile"
  end

  def edit_view
    editPost = Post.all.find_by_id(params[:id])
  end

  def update_view
    updatePost = Post.all.find_by_id(params[:id])
    # 목표 드롭다운 수정
    # 목표 성취 체크박스 수정
    updatePost.title = params[:input_post_title]
    updatePost.content = params[:input_post_content]
    updatePost.grade = params[:input_post_grade]
    updatePost.save
    redirect_to "/myprofile"
  end
  
  def destroy_view
    destroyPost = Post.all.find_by_id(params[:id])
    destroyPost.destroy
    redirect_to "/myprofile"
  end
  
  def comment_create
    new_comment = Comment.new
    new_comment.editor = params[:input_comment_editor]
    new_comment.editor = params[:input_comment_editor]
    new_comment.save
  end
#Post CRUD 액션 끝

  def list_update
  end
end
