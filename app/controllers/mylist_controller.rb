class MylistController < ApplicationController
  
  def mylist_model
      
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
    
    now_year_len = @mylist.where(year: $Current_Year).length
    now_year_achieve_len = @mylist.where(year: $Current_Year, complete: true).length
    
    $achivement_percent = now_year_achieve_len / now_year_len.to_f * 100
    
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
  
  def myplan_sub_complete
  
    myplan = Myplan.find(params[:myplan_id])
    myplan.sub_complete = params[:sub_complete]
    myplan.save
    
    redirect_to '/mylist'
    
  end
  
end
