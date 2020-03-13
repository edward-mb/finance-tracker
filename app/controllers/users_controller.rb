class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @friends = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    if params[:friend].present?
      @users = User.search(params[:friend])
      @users = current_user.except_current_user(@users)
      unless @users
        flash.now[:alert] = "Couldn't find user"
      end
    else
      flash.now[:alert] = "Please enter a friend name or email to search"
    end
    respond_to do |format|
      format.js { render partial: "users/friend_result" }
    end
  end
end
