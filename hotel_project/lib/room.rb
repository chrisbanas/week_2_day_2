class Room

    def initialize(capacity)
        @capacity = capacity # number
        @occupants = []
    end

# getter methods

    def capacity
        @capacity
    end

    def occupants
        @occupants
    end

# other methods

    def full?
       @occupants.length >= @capacity ? true : false
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(name) # string
        if !(self.full?)
            @occupants << name
            return true
        elsif self.full?
            return false
        end
    end

end
