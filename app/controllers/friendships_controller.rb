class FriendshipsController < ApplicationController
  def create
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:id])
    friendship.destroy
    flash[:notice] = "Stoped following"
    redirect_to my_friends_path
  end
end
