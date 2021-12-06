class User < ApplicationRecord
    has_many :hostels
    has_many :friends

    has_secure_password

    def friend?(user)
        friend.exist?(user: user)
    end

    def find_friend(user)
        friend.find_by(user: user)
    end

end