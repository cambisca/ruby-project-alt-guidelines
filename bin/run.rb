require_relative '../config/environment'
 
beer_app = Application.new
beer_app.user = beer_app.welcome
 
#user_or_nil = beer_app.ask_user_to_login_or_register
 
 
# until user_or_nil
#     # system "clear"
#     user_or_nil = beer_app.ask_user_to_login_or_register
# end
 
#beer_app.user = beer_app.login_helper
beer_app.main_menu
