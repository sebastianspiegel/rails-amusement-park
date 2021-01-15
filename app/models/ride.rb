class Ride < ActiveRecord::Base
    belongs_to :attraction 
    belongs_to :user 

    def take_ride
        if self.user.tickets < self.attraction.tickets || self.user.height < self.attraction.min_height
            cannot_ride
        else
            self.user.decrement!(:tickets, by = attraction.tickets)
            self.user.increment!(:happiness, by = attraction.happiness_rating)
            self.user.increment!(:nausea, by = attraction.nausea_rating)
            "Thanks for riding the #{attraction.name}!"
        end
    end

    def cannot_ride
        if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
            "Sorry. " + not_enough_tickets + " " + not_tall_enough
        elsif user.tickets < attraction.tickets
            "Sorry. " + not_enough_tickets
        else
            "Sorry. " + not_tall_enough
        end
    end

    def not_enough_tickets
        "You do not have enough tickets to ride the #{self.attraction.name}."
    end

    def not_tall_enough
        "You are not tall enough to ride the #{self.attraction.name}."
    end
end
