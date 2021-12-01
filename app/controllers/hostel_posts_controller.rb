class HostelPostsController < ApplicationController


    def index

        render json: HostelPost.all
    end

    def create
        post = Post.create!(post_params)
        render json: post, status: :created
    end
    private
    def post_params
        params.permit(:user_id, :hostel_name,:image,:rating, :event_review, :social_review, :additional_comment, :currently_staying, :country  )
    end

end
