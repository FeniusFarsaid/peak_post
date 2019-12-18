class Ascent < ActiveRecord::Base

    belongs_to :user
    belongs_to :peak
    validates_presence_of :datetime, :route


end