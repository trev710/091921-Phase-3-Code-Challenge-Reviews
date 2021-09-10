class Product < ActiveRecord::Base
    has_many :reviews 
    has_many :users, through: :reviews 

    def leave_review(user, star_rating, comment)
        Review.create(star_rating: star_rating, comment: comment, product_id: self.id, user_id: user.id)
    end

    def print_all_reviews 
        self.reviews.map do |review|
            review.print_review 
        end
    end

    def average_rating
       total_ratings = self.reviews.map(&:star_rating).sum()
       total_ratings / self.reviews.length.to_f
    end
end