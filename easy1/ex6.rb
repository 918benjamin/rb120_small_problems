# There is nothing technically incorrect about this class, but the definition
# may lead to problems in the future. How can this class be fixed to be resistant
# to future problems?

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# Initial guess (because I don't know what Database.init is doing)
# We're not explicitly needing a setter method, so using attr_accessor is
# creating one when we don't need one. We could replace attr_accessor with
# attr_reader to create only the getter method, or remove it altogether if we
# need neither of them.