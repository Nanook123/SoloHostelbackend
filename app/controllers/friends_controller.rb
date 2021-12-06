class FriendsController < ApplicationController
    skip_before_action :authorize, only: [:create, :destroy]

def create
        # @user = User.find(params[:user_id])
        friend = Friend.create(friend_params)
        render json: friend
    end

    def index
        
        render json: Friend.where(user_id: @current_user.id)
    end


    def destroy
        @friend = Friend.find(params[:id])
        @friend.destroy
        redirect_to @friend.user, success: " You are not longer following #{ @user.username}"
    end
    private

    def friend_params
        params.require(:friend).permit(:friend_id, :user_id)
    end
end
