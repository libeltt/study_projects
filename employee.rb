
class Employee
 	attr_accessor :name

	def initialize(name = "Anonymous")
		self.name=(name)
	  raise "Name can't be blank!" if name.empty?
	end

	def print_name
		puts "Name: #{self.name}"
	end
end

class SalariedEmployee < Employee
  attr_reader :salary

  def initialize(name = "Anonymous", salary = 0.0)
    super(name)
    self.salary = salary  # Use setter method for validation
  end

  def salary=(salary)
    raise "A salary of #{salary} isn't valid!" if salary < 0
    @salary = salary
  end

  def print_pay_stub
    print_name  # Reuse the print_name method from Employee
    pay_for_period = (self.salary.to_f / 365) * 14
    formatted_pay = format("%.2f", pay_for_period)
    puts "Pay This Period: $#{formatted_pay}"
  end
end

class HourlyEmployee < Employee

  def self.security_guard(name)
  	HourlyEmployee.new(name, 19.25, 30)
  end

  def self.cashier(name)
  	HourlyEmployee.new(name, 12.75, 25)
  end

  def self.janitor(name)
  	HourlyEmployee.new(name, 10.50, 20)
  end   
  	
  attr_reader :hourly_wage, :hours_per_week

  def initialize(name = "Anonymous", hourly_wage = 0.0, hours_per_week = 0.0)
    super(name)
    self.hourly_wage = hourly_wage
    self.hours_per_week = hours_per_week
  end
 

  def hourly_wage=(hourly_wage)
    raise "Hourly wage of #{hourly_wage} isn't valid!" if hourly_wage < 0
    @hourly_wage = hourly_wage
  end

  def hours_per_week=(hours_per_week)
    raise "Hours per week of #{hours_per_week} isn't valid!" if hours_per_week < 0
    @hours_per_week = hours_per_week
  end

  def print_pay_stub
    print_name  # Reuse the print_name method from Employee
    pay_for_period = hourly_wage * hours_per_week * 2
    formatted_pay = format("$%.2f", pay_for_period)
    puts "Pay This Period: #{formatted_pay}"
  end
end


salaried_employee = SalariedEmployee.new("Jane Doe", 50000)
salaried_employee.print_pay_stub

hourly_employee = HourlyEmployee.new("John Smith", 14.97, 30)
hourly_employee.print_pay_stub

angela = HourlyEmployee.security_guard("Angela Matthews")
edwin = HourlyEmployee.janitor("Edwin Burgess")
ivan = HourlyEmployee.cashier("Ivan Stokes")

angela.print_pay_stub
edwin.print_pay_stub
ivan.print_pay_stub