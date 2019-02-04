class HomeController < ApplicationController
  def index
  end

  def gotmk
    
    @Nameresult = params[:inputName]
    
    @ImgAry = (1..5).to_a
    
    @ImgPick = @ImgAry.sample(1)
    
  end
end
