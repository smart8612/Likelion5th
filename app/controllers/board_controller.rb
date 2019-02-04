class BoardController < ApplicationController
  def index
    @myboard = Question.all
  end

  def new
  end
  
  def create
    @makeboard = Question.new
    @makeboard.name = params[:input_name]
    @makeboard.contents = params[:input_contents]
    @makeboard.save
  end
  
  def destroy
    
    des_id = params[:board_id]
    des_board = Question.find(des_id)
    des_board.destroy
    
    redirect_to '/index'
  end
  
  def update_view
    @upd_board = Question.find(params[:board_id])
  end
  
  def update
    ques_board = Question.find(params[:board_id])
    ques_board.name = params[:input_name]
    ques_board.contents = params[:input_contents]
    ques_board.save
    
    redirect_to '/index'
  end
  
end
