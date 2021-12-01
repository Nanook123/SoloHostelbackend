class Friend < ApplicationRecord
    belongs_to :user
    has_many :hostel_posts, through: :users
end

