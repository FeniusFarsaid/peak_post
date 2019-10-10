class Peak < ActiveRecord::Base

    has_many :ascents
    has_many :users, through: :ascents

end