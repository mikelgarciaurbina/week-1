require_relative './Employee.rb'
require_relative './Payroll.rb'

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
mikel = HourlyEmployee.new('Mikel', 'mikel@ironhack.com',15, 50)
alfon = HourlyEmployee.new('Alfon', 'alfon@ironhack.com',15, 50)

employees = [josh, nizar, ted, mikel, alfon]
payroll = Payroll.new(employees)
payroll.pay_employees
