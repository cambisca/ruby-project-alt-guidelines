class Beer < ActiveRecord::Base 

    has_many :beer_orders 
    # has_many :brewbeers
    has_many :reviews 
    has_many :orders, through: :beer_orders 
    has_many :users, through: :reviews 
    # has_many :brewerys, through: brewbeers



end 