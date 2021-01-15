class Attraction < ApplicationRecord
    has_many :rides 
    has_many :users, through: :rides 
    validates :name, :happiness_rating, :nausea_rating, :min_height, :tickets, presence: true
end
