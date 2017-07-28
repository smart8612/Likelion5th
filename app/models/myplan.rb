class Myplan < ActiveRecord::Base
    belongs_to :user
    belongs_to :mylist

end
