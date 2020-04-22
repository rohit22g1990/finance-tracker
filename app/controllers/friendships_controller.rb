class FriendshipsController < ApplicationController
  
  def create 
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Following user #{friend.full_name}"
    else
      flash[:alert] = "Somthing wring there"      
    end
    redirect_to friends_path
  end
  
  def destroy
    friend = User.find(params[:id])
    
    friendship = Friendship.where(user_id: current_user.id, friend_id: friend.id).first
    friendship.destroy
    flash[:notice] = "#{friend.full_name} was successfully unfollowed"
    redirect_to friends_path
  end
end
