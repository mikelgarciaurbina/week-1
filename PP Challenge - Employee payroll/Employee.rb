class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        super(name, email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hourly_rate * @hours_worked
    end
end


class SalariedEmployee < Employee
    def initialize(name, email, yearly_rate)
        super(name, email)
        @yearly_rate = yearly_rate
        
    end

    def calculate_salary
      @yearly_rate / 52
    end
end


class MultiPaymentEmployee < Employee
    def initialize(name, email, yearly_rate, hourly_rate, hours_worked)
        super(name, email)
        @yearly_rate = yearly_rate
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
		  (@hours_worked > 40) ? @yearly_rate / 52 + @hourly_rate * @hours_worked : @yearly_rate / 52
    end
end