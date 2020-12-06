User.destroy_all
Beer.destroy_all
Order.destroy_all 
BeerOrder.destroy_all

conor = User.create(username: "Conor", password: "Buzzin123")
james = User.create(username: "James", password: "Bro123")
cam = User.create(username: "Cam", password: "Wacked123")
meghan = User.create(username: "Meghan", password: "Tipsy123")
massi = User.create(username: "Massi", password: "Cutegal123")

logical_conclusion = Beer.create(name: "Logical Conclusion", style: "IPA", brewer: "Three's Brewing", price: 30)
guinness = Beer.create(name: "Guinness", style: "Stout", brewer: "Guinness", price: 18)
watermelon_glow_up = Beer.create(name: "Watermelon Glow Up", style: "Sour", brewer: "Folksbier", price: 24)
pacifico = Beer.create(name: "Pacifico", style: "Lager", brewer: "Pacifico", price: 12)
budweiser = Beer.create(name: "Bud Heavy", style: "Lager", brewer: "Budweiser", price: 10)
daisy_cutter = Beer.create(name: "Daisy Cutter", style: "IPA", brewer: "Half Acre", price: 26)
edward = Beer.create(name: "Edward", style: "IPA", brewer: "Maine Co.", price: 28)

order1 = Order.create(user_id: conor.id, checked_out: true)
order2 = Order.create(user_id: james.id, checked_out: true)
order3 = Order.create(user_id: cam.id, checked_out: true)
order4 = Order.create(user_id: meghan.id, checked_out: true)
order5 = Order.create(user_id: massi.id, checked_out: false)
order6 = Order.create(user_id: james.id, checked_out: true)
order7 = Order.create(user_id: james.id, checked_out: true)


beerorder1 = BeerOrder.create(beer_id: logical_conclusion.id, order_id: order1.id)
beerorder2 = BeerOrder.create(beer_id: guinness.id, order_id: order2.id)
beerorder3 = BeerOrder.create(beer_id: watermelon_glow_up.id, order_id: order1.id)
beerorder4 = BeerOrder.create(beer_id: pacifico.id, order_id: order4.id)
beerorder5 = BeerOrder.create(beer_id: budweiser.id, order_id: order5.id)
beerorder6 = BeerOrder.create(beer_id: logical_conclusion.id, order_id: order6.id)
beerorder7 = BeerOrder.create(beer_id: guinness.id, order_id: order7.id)
beerorder7 = BeerOrder.create(beer_id: guinness.id, order_id: order3.id)

review1 = Review.create(user_id: conor.id, beer_id: guinness.id)
review2 = Review.create(user_id: cam.id, beer_id: logical_conclusion.id)
review3 = Review.create(user_id: james.id, beer_id: budweiser.id)



puts "Data is seeded!"