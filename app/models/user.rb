class User < ApplicationRecord
    validates :name, {presence: true}
    validates :password, {presence: true}    
    validates :age, {presence: true, numericality: {greater_than_or_equal_to: 1, less_than: 100}}
    validates :height, {presence: true, numericality: {greater_than_or_equal_to: 100, less_than: 250}}
    validates :weight, {presence: true, numericality: {greater_than_or_equal_to: 30, less_than: 200}}

    def posts
        return Post.where(user_id: self.id)
    end
end
