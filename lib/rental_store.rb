require 'pry'
class RentalStore
  attr_reader :store_name
  attr_accessor :customers, :movies, :current_customer

  def initialize(store_name)
    @store_name = store_name
    @movies = []
    @customers = []
  end

  def sign_up_customer
    # TODO
  end

  def add_customer(customer)
    self.customers << customer
  end

  def print_all_customers
    puts "\nCustomers:"
    self.customers.each_with_index { |c, i| puts "#{i+1}: #{c.name} - #{c.email}"}
  end

  def find_customer_account
    loop do
      puts "\nFind Customer By Name or Email Address"
      puts "Press 1 to go back to previous menu"

      user_input = gets.chomp

      self.customer_menu if user_input == "1"

      customer = self.search_customers(user_input)
      self.current_customer = customer ? customer : nil
      # TODO display customer's account
      puts customer.name
    end
  end

  def search_customers(customer)
    # TODO handle multiple customers found
    found = self.customers.find { |c| c.name.downcase.include?(customer.downcase) || c.email.downcase.include?(customer.downcase) }
    if !found
      return "Customer Not Found"
    end
    puts "\nCustomer Found:"
    found
  end

  def check_out_movie(movie)
    # TODO
  end

  def check_in_movie(movie)
    # TODO
  end

  def add_movie(movie)
    self.movies << movie
  end

  def remove_movie(movie)
    self.movies.delete { |m| m.title == movie.title }
  end

  def print_all_new_releases
    nr = self.movies.select { |m| m.type == "NR"}
    if nr.length == 0
      puts "There are no new releases"
      return
    end
    puts "\nNew Releases:"
    nr.each_with_index { |m, i| puts "#{i+1}: #{m.title}" }
  end

  def print_all_in_stock
    in_stock = self.movies.select { |m| m.in_stock }
    if in_stock.length == 0
      puts "There's nothing in stock right now!"
      return
    end
    puts "\n In Stock Movies:"
    in_stock.each_with_index { |m, i| puts "#{i+1}: #{m.title}" }
  end

  def run
    user_input = nil
    puts "***** Welcome to #{store_name} *****".upcase
    loop do
      self.main_menu
    end
  end

  def quit
    puts "\nShutting down..."
    exit(true)
  end

  def main_menu
    puts "\n"
    puts "1. Movie Menu"
    puts "2. Customer Menu"
    puts "3. Shutdown"
    print "\nEnter the number of your selection: "

    user_input = gets.chomp.to_i
    self.movie_menu if user_input == 1
    self.customer_menu if user_input == 2
    self.quit if user_input == 3
  end

  def movie_menu
    menu = [
      "See What's in Stock", "See New Releases", "Search Movies", "Return to Main Menu", "Shutdown"
    ]
    loop do
      puts "\n"
      menu.each_with_index { |item, i| puts "#{i+1}: #{item}" }
      print "\nEnter the number of your selection: "

      user_input = gets.chomp.to_i

      case user_input
        when 1
          self.print_all_in_stock
        when 2
          self.print_all_new_releases
        when 3
          self.search_movies if user_input == 3
        when 4
          self.main_menu
        when 5
          self.quit
      end
    end
  end

  def search_movies(movie)
    # TODO
  end

  def edit_stock_menu
    # TODO
    # Add, remove movies
  end

  def customer_menu
    menu = ["Find Customer Account", "View Customer List", "Return to Main Menu", "Shutdown"]
    loop do
      puts "\n"
      menu.each_with_index { |item, i| puts "#{i+1}: #{item}" }
      print "\nEnter the number of your selection: "

      user_input = gets.chomp.to_i

      case user_input
        when 1
          self.find_customer_account
        when 2
          self.print_all_customers
        when 3
          self.main_menu
        when 4
          self.quit
      end
    end
  end
end

