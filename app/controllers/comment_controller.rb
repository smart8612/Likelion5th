class CommentController < ApplicationController
    
    def reply_create
        
        new_reply = Reply.new
        new_reply.dbEditor = params[:inputEditor]
        new_reply.dbContent = params[:inputReply]
        new_reply.post_id = params[:reply_id]
        new_reply.save
        
        redirect_to :back
        
    end
    
    def reply_delete
        
        del_comment = Reply.find(params[:reply_id])
        del_comment.destroy
    
        
        redirect_to :back
    end
end
