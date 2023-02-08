require_relative "room"

class Hotel


    def initialize(name, capacities)
        @name = name
        @rooms = {}

        capacities.each { |room_name, capacity| @rooms[room_name] = Room.new(capacity) }
    end

    def name
      words = @name.split(" ")
      (words.map { |word| word.capitalize }).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        @rooms.has_key?(room_name) ? true : false
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person) # although it is asking a boolen it still does the operation of the function to add a person
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?

        @rooms.values.any? { |room| room.available_space > 0 } # .values creates an array of values to iterate over.

    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts room_name + " " + room.available_space.to_s
        end
    end

end
