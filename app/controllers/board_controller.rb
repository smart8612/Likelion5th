class BoardController < ApplicationController
  def index
  end

  def new
  end
  
  def save
    
    @dateResult = params[:inputDate]
    @timeResult = params[:inputTime]
    @placeResult = params[:inputPlace]
    @peopleResult = params[:inputPeople]
    @textResult = params[:inputText]
    @textHash = params[:inputHash]
    @categoryResult = params[:inputCategory]
    @building_nameResult = params[:inputBuilding]
    
    u = Post.new
    
    u.bookdate = @dateResult
    u.booktime = @timeResult
    u.bookplace = @placeResult
    u.bookpeople = @peopleResult
    u.booktext = @textResult
    u.hashtag = @textHash
    u.category = @categoryResult
    u.building_name = @building_nameResult
    
    u.save
    
    redirect_to '/simple'
    
  end

  def simple
  
    @posts = Post.all  
  
  end

  def detail
    
    @card = Post.find(params[:id])
    
  end
  
  def update_edit
  
    @data_show = Post.find(params[:board_id])
    
  end
  
  def update
    
    @dateUpdResult          = params[:inputDate_upd]
    @timeUpdResult          = params[:inputTime_upd]
    @placeUpdResult         = params[:inputPlace_upd]
    @peopleUpdResult        = params[:inputPeople_upd]
    @textUpdResult          = params[:inputText_upd]
    @categoryUpdResult         = params[:inputCategory_upd]
    @building_nameUpdResult    = params[:inputBuilding_name_upd]
    
    data_update = Post.find(params[:board_id])
    data_update.bookdate    = @dateUpdResult
    data_update.booktime    = @timeUpdResult
    data_update.bookplace   = @placeUpdResult
    data_update.bookpeople  = @peopleUpdResult
    data_update.booktext    = @textUpdResult
    data_update.category    = @categoryUpdResult
    data_update.building_name = @building_nameUpdResult
    data_update.save
    
    redirect_to '/detail'
    
  end
  
  def delete
    
    del = Post.find(params[:board_id])
    del.destroy
    
    redirect_to '/detail'
  end
  
  def join
  end
  
  def join_write
    join_myname = params[:myname]
    join_email = params[:email]
    join_nickname = params[:nickname]
    join_password = params[:password]
    join_phonenumber = params[:phonenumber]
    join_jobcategory = params[:jobcategory]
    join_interest1 = params[:interest1]
    join_interest2 = params[:interest2]
    join_interest3 = params[:interest3]
    
    @individual_new = Individual.new
    @individual_new.myname = join_myname
    @individual_new.email = join_email
    @individual_new.nickname = join_nickname
    @individual_new.password = join_password
    @individual_new.phonenumber = join_phonenumber
    @individual_new.jobcategory = join_jobcategory
    @individual_new.interest1 = join_interest1
    @individual_new.interest2 = join_interest2
    @individual_new.interest3 = join_interest3
    @individual_new.save
    
  end
  
  def join_list
  @individual_list = Individual.all
  end

end