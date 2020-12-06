require_relative '../config/environment'

beer_app = Application.new
beer_app.welcome

user_or_nil = beer_app.ask_user_to_login_or_register


until user_or_nil
    # system "clear"
    user_or_nil = beer_app.ask_user_to_login_or_register
end

#why does it loop twice
beer_app.user = user_or_nil
beer_app.main_menu
