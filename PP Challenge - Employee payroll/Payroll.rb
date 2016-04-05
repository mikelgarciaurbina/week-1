class Payroll
    def initialize(employees)
        @employees = employees
    end

   	def notify_employee(employee)
   		puts "*************** EMAIL ***************"
   		puts "Name: " + employee.name
   		puts "Email: " + employee.email
   		puts "This month you will recieve " + employee.calculate_salary.to_s + "€."
    	puts "*************************************\n"
  	end

	def pay_employees
	  	total = @employees.reduce(0.0){|sum, emp| sum + emp.calculate_salary}

	  	@employees.each do |employee|
	  		puts employee.name + "===>" + employee.calculate_salary.to_s
	  		notify_employee(employee)
	  	end
	  	
	  	total += total * 0.18
	  	puts "\nTOTAL ==> " + total.to_s
	end
end