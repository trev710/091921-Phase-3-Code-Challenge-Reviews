
class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def remove_reviews(product) 
        self.reviews.map do |review|
            if review.product_id == product.id 
                review.destroy
            end
        end
    end

    def favorite_product 
        self.products.sort_by {|product| product.reviews.map(&:star_rating)}
    end
end