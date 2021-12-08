class HostelsController < ApplicationController
   
    def index
        friends = Friend.where(user_id: @current_user.id).map(&:friend_id)
        render json: Hostel.where('user_id IN (?)', friends)
    end

    def mine
        render json: Hostel.where(user_id: @current_user.id)
    end

    def create
        hostel = Hostel.create(post_params)
        render json: hostel, status: :created
    end

    def destroy
        hostel = Hostel.find(params[:id])
        hostel.destroy
    end

    private

    def post_params
        params.require(:hostel).permit(:user_id, :hostel_name, :image ,:rating, :event_review, :social_review, :additional_comment, :currently_staying, :country, :username)
    end

end

