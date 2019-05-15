class FriendsController < ApplicationController
    
    def index
    
    @friends = []
    @request_friends = []
    @receive_friends = []
    @friend_status = ""
    
    Friend.where(follower: current_user.id).each do |f|
      if Friend.find_by('follower = ? and followed = ?', f.followed, current_user.id) 
      logger.debug("--------------------- 友達　f.followed = #{f.followed}")
        @friends.push(f.followed)
        @friend_status = "f"
        
      else
      logger.debug("--------------------- 申請中f.followed = #{f.followed}")
       
        @request_friends.push(f.followed)
        @friend_status = "r"

      end
     end
 end
end
