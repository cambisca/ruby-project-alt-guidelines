class Application 

attr_reader :prompt
attr_accessor :user


def initialize
    @prompt = TTY::Prompt.new
end

def welcome
    prompt.select("Hi, welcome to Beer Street! Are you over the age of 21?") do |menu|
        menu.choice "Yes", -> {ask_user_to_login_or_register}
        menu.choice "No", -> {underage}
    end
end

def ask_user_to_login_or_register
    prompt.select("Would you like to login or register?") do |menu|
        menu.choice "Login", -> {login_helper}
        menu.choice "Register", -> {register_helper}
        end
end

def underage
    puts "We'll see you in a few years :)"
    exit
end

def login_helper
    User.login_a_user
end


def register_helper
    User.register_a_user
end

def calls_on_order_history
    user.order_history
    prompt.select("Would you like to revisit the main menu?") do |menu|
        menu.choice "Yes", -> {main_menu}
        menu.choice "No", -> {exit_app}
    end
   
end

def main_menu
    prompt.select("What would you like to do?") do |menu|
        menu.choice "Browse by style", -> {browse_by_style}
        menu.choice "Order History", -> {calls_on_order_history}
        menu.choice "Beer Reviews", -> {view_beer_helper}
        menu.choice "Leave a review", -> {leave_review_helper}
        menu.choice "View your cart", -> {view_your_cart}
        menu.choice "Exit application", -> {exit_app}
    end

end

def view_beer_helper
    user.view_beer_reviews
    main_menu
end

def exit_app
    puts "Hope to see you soon!"
    exit
end

def view_your_cart
    current_cart = user.current_cart.beer_orders.map { |beer_order| "#{beer_order.id}) #{beer_order.beer.name}"}
    if current_cart.count > 0
        puts current_cart
    else
        puts "Your cart is empty"
        main_menu
    end

    prompt.select("Would you like to checkout?") do |menu|
        menu.choice "Checkout", -> {submit_helper}
        menu.choice "I'm still thirsty", -> {main_menu}
        menu.choice "Cancel order", -> {user.cancel_order}
        menu.choice "Remove from cart", -> {help_remove_beer}
    end

end

def submit_helper
    user.submit_order
    puts "Your order has been submitted!"
    main_menu
end

def help_remove_beer
    puts "Please type in the order number you would like removed"
    remove = gets.chomp
    user.remove_beer_from_cart(remove)
    puts "Your item has been reviewed"
    main_menu
end


def leave_review_helper
    list_of_beers = user.beers.map { |beer| beer.name }
    
    choice = prompt.select("Which beer would you like to review?", list_of_beers.uniq)#added.uniq
    chosen = Beer.find_by(name: choice)
    if choice
        user.leave_a_review(chosen)
    end
    
    main_menu

end


def browse_by_style
    prompt.select("What would you like to do?") do |menu|
        menu.choice "IPA", -> {ipa_list}
        menu.choice "Lager", -> {lager_list}
        menu.choice "Sour", -> {sour_list}
        menu.choice "Stout", -> {stout_list}
    end
end

def ipa_list
    list_of_ipa = Beer.all.select { |beer| beer.style == "IPA" }
    final_list = list_of_ipa.map { |beer| beer.name }.uniq
    choice = prompt.select("Which IPA would you like to add to cart?", final_list)
    if choice
        chosen = Beer.find_by(name: choice)
        user.add_beer_to_cart(chosen)
        puts "Your beer has been added to your cart!"
        main_menu
        else
        end

end


def lager_list
    list_of_lager = Beer.all.select { |beer| beer.style == "Lager" }
    final_list = list_of_lager.map { |beer| beer.name }.uniq
    choice = prompt.select("Which Lager would you like to add to cart?", final_list)
        if choice
            chosen = Beer.find_by(name: choice)
            user.add_beer_to_cart(chosen)
            puts "Your beer has been added to the cart!"
            main_menu
        else
        end
end

def sour_list
    list_of_sour = Beer.all.select { |beer| beer.style == "Sour" }
    final_list = list_of_sour.map { |beer| beer.name }.uniq
    choice = prompt.select("Which Sour would you like to add to cart?", final_list)
        if choice
            chosen = Beer.find_by(name: choice)
            user.add_beer_to_cart(chosen)
            puts "Your beer has been added to the cart!"
            main_menu
        else
        end
end

def stout_list
    list_of_stout = Beer.all.select { |beer| beer.style == "Stout" }
    final_list = list_of_stout.map { |beer| beer.name }.uniq
    choice =  prompt.select("Which Stout would you like to cart?", final_list)
        if choice
            chosen = Beer.find_by(name: choice)
            user.add_beer_to_cart(chosen)
            puts "Your beer has been added to the cart!"
            main_menu
        else
        end
    end

end
