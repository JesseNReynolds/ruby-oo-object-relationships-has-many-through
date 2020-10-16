class Customer
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
      @name = name
      @age = age
      @@all << self
    end

    def self.all
      @@all
    end

    def meals
        Meal.all.select do |meal|
          meal.customer == self
        end
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    def waiters
        my_waiters = []
        Meal.all.select do |meal|
           if meal.customer == self
               my_waiters << meal.waiter
            end
        end
        return my_waiters
    end

  end
