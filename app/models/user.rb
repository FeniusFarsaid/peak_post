class User < ActiveRecord::Base

    has_many :ascents
    has_many :peaks, through: :ascents
    has_secure_password

end

