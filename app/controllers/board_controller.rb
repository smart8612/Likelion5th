class BoardController < ApplicationController
  def index
    @data_text = Post.all
  end

  def show
    @data_show = Post.find(params[:board_id])
    @comment_show = Reply.all
    
  end

  def new
  end

  def create
    
    @titleResult = params[:inputTitle]
    @editorResult = params[:inputEditor]
    @contentResult = params[:inputContent]
    
    data = Post.new
    data.title = @titleResult
    data.editor = @editorResult
    data.content = @contentResult
    data.save
    
    redirect_to '/index'
    
  end

  def edit
    
    @upd_board = Post.find(params[:board_id])
    
  end

  def update
    
    data_update = Post.find(params[:board_id])
    data_update.title = params[:inputTitle]
    data_update.editor = params[:inputEditor]
    data_update.content = params[:inputContent]
    data_update.save
    
    redirect_to '/index'
    
  end

  def delete
    
    des_board = Post.find(params[:board_id])
    des_board.destroy
    
    redirect_to '/index'
    
  end
end
