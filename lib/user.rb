class User < ActiveRecord::Base
 
    has_many :orders
    has_many :reviews
    has_many :beer_orders, through: :orders
    has_many :reviews_beers, through: :reviews, source: :beer
    has_many :beers, through: :beer_orders
  
    attr_reader :prompt

    def self.login_a_user
        puts "What is your username?"
        users_login_name = gets.chomp
        puts "What is your password?"
        pass = gets.chomp
        user = User.find_by(username: users_login_name, password: pass)
      
        if user.nil?  
            puts "Sorry, we don't know of anyone with that username and password"
            login_a_user
        else
            user
        end
      
    end
  
  
    def self.register_a_user
        puts "What would you like your username to be?"
        new_username = gets.chomp
        user = User.find_by(username: new_username)
        if user 
            puts "Sorry that username is taken"
            self.register_a_user
        else
            puts "What would you like your password to be?"
            pass = gets.chomp
            new = User.create(username: new_username, password: pass)
            user = new
            puts "Welcome to the block party!"
        end
        self.login_a_user 
    end
  
     def order_history
        past_orders = orders.where(checked_out: true)
        order_beers_array = []
        order_and_beers = past_orders.each_with_index do |order, index|
            beers_in_orders = order.beers.map { |beer| beer.name } 
            order_beers_array << "Order #{index + 1}) Beers: #{beers_in_orders.join(", ")}"
         
        end
  
        puts order_beers_array
       
    end
  
    
    def leave_a_review(beer)

        prompt = TTY::Prompt.new
   
       rating = prompt.select("Rate beer 1 being worst 5 being best") do |menu|
            menu.choice "1"
            menu.choice "2"
            menu.choice "3"
            menu.choice "4"
            menu.choice "5"
        end
        create_a_review(beer,rating)
        puts "Thanks for your review!"
     
      
    end
  
    def create_a_review(beer,rating)
         Review.create(user_id: self.id, beer_id: beer.id, rating: rating)
    end
  
    def reorder_beer
        add_beer_to_cart
    end
  
    def all_beers
        Beer.all
    end
  
    def review_helper 
        self.order_history
     
    end
  
   def view_beer_reviews
       
        name_of_beers_for_review = Review.all.map{|review|review.beer.name}
        ratings_of_beers = Review.all.map{|review|review.rating}
        user_for_rating = Review.all.map{|review|review.user.username}
 
        counter = 0
        ratings_of_beers.each do |review|
            puts "#{user_for_rating[counter]} gave #{name_of_beers_for_review[counter]} a rating of #{ratings_of_beers[counter]}"
            counter += 1
        end

    end
  
    def current_cart 
        orders.find_or_create_by(checked_out: false)
    end
  
    def add_beer_to_cart(beer) 
        BeerOrder.create(order: self.current_cart, beer: beer)
    end
  
    def remove_beer_from_cart(beer_order_id)
        current_cart.beer_orders.find(beer_order_id).destroy
     
    end
  
    def submit_order 
        self.current_cart.update(checked_out: true)
    end
   
    def cancel_order 
        current_cart.beers.destroy_all
        puts "Your order has been canceled"
    end
  
  
 end
 