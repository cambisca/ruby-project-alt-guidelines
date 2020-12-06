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
        binding.pry
        user.order_history 
    end 
 

    def main_menu 
        prompt.select("What would you like to do?") do |menu|
            menu.choice "Browse by style", -> {browse_by_style}
            menu.choice "Order History", -> {calls_on_order_history}
            menu.choice "Our recommendations", -> {underage}
            # menu.choice "Browse most popular selections", -> {underage}
            # menu.choice "Browse Breweries", -> {underage}
        end

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
        prompt.select("Which IPA would you like?", final_list)
        # binding.pry
    end 


    def lager_list
        list_of_lager = Beer.all.select { |beer| beer.style == "Lager" }
        final_list = list_of_lager.map { |beer| beer.name }.uniq
        prompt.select("Which Lager would you like?", final_list)
    end 

    def sour_list
        list_of_sour = Beer.all.select { |beer| beer.style == "Sour" }
        final_list = list_of_sour.map { |beer| beer.name }.uniq
        prompt.select("Which Sour would you like?", final_list)
    end 

    def stout_list
        list_of_stout = Beer.all.select { |beer| beer.style == "Stout" }
        final_list = list_of_stout.map { |beer| beer.name }.uniq
        prompt.select("Which Stout would you like?", final_list)
    end 

 
end 