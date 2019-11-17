class Customer
  attr_accessor :name, :email, :movies_out, :late_fees
  attr_reader :first_name, :last_name

  def initialize(name, email)
    @name = name
    @email = email
    @late_fees = 0
    @movies_out = []
    self.parse_name

    #debug
    puts "initializing customer..."
  end

  def parse_name
    n = name.split(" ")
    @first_name = n[0]
    @last_name = n[1]
  end

  def print_late_fees
    puts "You owe $#{late_fees}."
  end
end