class User < ActiveRecord::Base

    has_many :ascents
    has_many :peaks, through: :ascents
    validates_uniqueness_of :username
    validates_uniqueness_of :email
    has_secure_password

end

