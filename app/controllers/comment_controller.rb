class CommentController < ApplicationController
  def comment_create
    new_comment = Comment.new
    new_comment.content = params[:input_comment_content]
    new_comment.editor = current_user.email #params[:input_comment_editor]
    new_comment.post_id = params[:post_id]
    new_comment.save
    
    redirect_to '/post_show/' + params[:post_id]
  end

end
