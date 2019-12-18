class Peak < ActiveRecord::Base

    has_many :ascents
    has_many :users, through: :ascents
    validates_presence_of :name, :location, :elevation

end