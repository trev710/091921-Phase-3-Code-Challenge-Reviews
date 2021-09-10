# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)

puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."

stapler_review = Review.create(star_rating: 4, comment: "Great stapler!", product_id: product1.id, user_id: user1.id)

whiteboard_review = Review.create(star_rating: 3, comment: "Decent whiteboard!", product_id: product2.id, user_id: user1.id)

tape_review = Review.create(star_rating: 1, comment: "Not sticky enough!", product_id: product5.id, user_id: user2.id)

stapler_review2 = Review.create(star_rating: 5, comment: "Best stapler ever!", product_id: product1.id, user_id: user2.id)

puts "Seeding done!"

puts
puts
puts "REVIEW tests..."
puts tape_review.product.name
puts whiteboard_review.user.name
puts
puts "PRODUCT tests..."
puts product1.reviews.map(&:comment)
puts
puts product1.users.map(&:name)
puts
puts "USERS tests..."
puts user1.products.map(&:name)
puts
puts user1.reviews.map(&:star_rating)
puts
puts "print_review test..."
puts tape_review.print_review
puts
puts "leave_review test..."
puts product4.leave_review(user3, 4, "Wonderful pen!")
puts 
puts "print_all_reviews test..."
puts product1.print_all_reviews
puts
puts "average_rating test..."
puts product1.average_rating
puts 
puts "remove_reviews test..."
puts user3.reviews
puts user3.remove_reviews(product4)
puts "# I can see in the data table that the review was removed"
puts 
puts "favorite_product test..."
puts user1.favorite_product