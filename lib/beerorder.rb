class BeerOrder < ActiveRecord::Base 

    belongs_to :order 
    belongs_to :beer 
end 