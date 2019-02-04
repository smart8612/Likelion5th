class MylistController < ApplicationController
  
  before_action :mylist
  
  def mylist_model
      
    mylist = Mylist.new 
    mylist.goal = params[:goal]
    mylist.complete = params[:complete]
    
    if params[:now_year] == "true"
      
      mylist.year = $Current_Year
      
    end
    
    mylist.user_id = current_user.id
      
    mylist.save
    
    redirect_to :back
    
  end
  
  def mylist
    
    @mylist = Mylist.where(user_id: params[:user_id] if params[:user_id])
    
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
  
  def mylist_delete
  
    mylist = Mylist.find(params[:mylist_id])
    mylist.destroy
    
    redirect_to :back
    
  end
  
  def mylist_complete
  
    mylist = Mylist.find(params[:mylist_id])
    mylist.complete = params[:complete]
    mylist.save
    
    redirect_to :back
    
  end
  
  def myplan_model
    create_myplan = Myplan.new
    create_myplan.plan = params[:plan]
    create_myplan.mylist_id = params[:mylist_id]
    
    create_myplan.save
      
    redirect_to :back
    
  end
  
  def myplan_delete
    
    delete_myplan = Myplan.find(params[:myplan_id])
    delete_myplan.destroy
    
    redirect_to :back
    
  end
  
  def myplan_sub_complete
  
    myplan = Myplan.find(params[:myplan_id])
    myplan.sub_complete = params[:sub_complete]
    myplan.save
    
    redirect_to :back
    
  end
  
end
