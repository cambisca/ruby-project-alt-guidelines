class User < ActiveRecord::Base 

    has_many :orders 
    has_many :reviews 
    has_many :beer_orders, through: :orders 
    has_many :beers, through: :reviews 

    
    def self.login_a_user 
        puts "Welcome back!"
        puts "What is your username?"
        users_login_name = gets.chomp
        puts "What is your password?"
        pass = gets.chomp
        user = User.find_by(username: users_login_name, password: pass)
       
        if user.nil?  #if the user doesn't exist 
            puts "Sorry, we don't know of anyone with that username and password"
            login_a_user
        else 
            user
        end 
       
    end 

    # def self.faulty_login
    #     puts "What is your username?"
    #     users_login_name = gets.chomp
    #     puts "What is your password?"
    #     pass = gets.chomp
    #     user = User.find_by(username: users_login_name, password: pass)
       

    #     if user.nil?  #if the user doesn't exist 
    #         puts "Sorry, we don't know of anyone with that username and password"
    #         self.faulty_login
    #     else 
    #         user
    #     end 
    # end 


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
            User.create(username: new_username, password: pass)
            puts "Welcome to the block party!"
        end 
    end 

  
    def order_history 
        orders.where(checked_out: true)
        # prompt.select("What would you like to do with your previous orders?") do |menu|
        #     menu.choice past_orders, -> {order_history_choice}
        # end 
    end 

    def order_history_choice 
        prompt.select("Would you like to leave a review or re-order a beer") do |menu|
            menu.choice "Leave a review", -> {leave_a_review}
            menu.choice "Re-order a beer", -> {reorder_beer}
        end
    end 


    def leave_a_review
        prompt.select("Rate beer 1 being worst 5 being best") do |menu|
            menu.choice "1"
            menu.choice "2"
            menu.choice "3"
            menu.choice "4"
            menu.choice "5"
        end 

    end 

    def reorder_beer
        add_beer_to_cart
    end 


    def review_helper
        self.order_history
        list_of_ipa = Beer.all.select { |beer| beer.style == "IPA" }
            final_list = list_of_ipa.map { |beer| beer.name }.uniq
            prompt.select("Which IPA would you like?", final_list)
    end 

   
   
    def current_cart
        orders.find_or_create_by(checked_out: false)
    end 

    def add_beer_to_cart(beer)
        BeerOrder.create(order: self.current_cart, beer: beer)
    end 

    def remove_beer_from_cart(beer_order_id)
        BeerOrder.destroy(beer_order_id)
    end 

    def submit_order
        self.current_cart.update(checked_out: true)
    end 
    
    def cancel_order
        
    end 


end 