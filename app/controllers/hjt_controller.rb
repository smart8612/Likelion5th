class HjtController < ApplicationController
    
    def home_logout
    
        @random_feeds = Post.all.shuffle
    
    end
    
end
