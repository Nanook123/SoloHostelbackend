class FriendsController < ApplicationController
    skip_before_action :authorize, only: [:create]

    def create
        # @user = User.find(params[:user_id])
        friend = Friend.create(friend_params)
        render json: friend
    end

    def index
        render json: Friend.where(user_id: @current_user.id)
    end

    def destroy
        # Make sure we're not deleting someone else's friendship
        @friend = Friend.where(id: params[:id], user_id: @current_user.id).first
        @friend.destroy
        render json: {}, status: :ok
    end
    private

    def friend_params
        params.require(:friend).permit(:friend_id, :user_id)
    end
end
