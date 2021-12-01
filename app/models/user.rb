class User < ApplicationRecord
    has_many :hostel_posts
    has_many :friends

    has_secure_password
end