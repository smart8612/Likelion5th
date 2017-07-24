class CommentController < ApplicationController
    def comment_create
    new_comment = Comment.new
    new_comment.save
    
    redirect_to '/post_show/:id'
    end
end
