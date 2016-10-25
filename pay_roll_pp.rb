require 'pry'

class Employee
  attr_reader :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end
  def show_salary
    print "#{@name}'s weekly salary: Raw => #{calculate_salary.round(2)} | "
    print "Net => #{calculate_taxed_salary.round(2)}\n"
  end

  def calculate_taxed_salary
    calculate_salary * 82/100
  end
end

#STEP 1
class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        super(name,email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      @hours_worked * @hourly_rate
    end
end

class SalariedEmployee < Employee
    def initialize(name, email, annual_salary)
        super(name,email)
        @annual_salary = annual_salary
    end

    def calculate_salary
      (@annual_salary.to_f/365) * 7
    end
end

class MultiPaymentEmployee < Employee
    def initialize(name, email, annual_salary, hourly_rate, hours_worked)
        super(name,email)
        @annual_salary = annual_salary
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      ((@annual_salary.to_f/365) * 7) + (@hours_worked * @hourly_rate)
    end
end

#STEP 2 & 3

class PayRoll
  def initialize(employees)
    @employees = employees
  end
  def pay_employees
    @employees.each do |employee|
      employee.show_salary
      notify_employee(employee)
    end
  end

  def notify_employee(employee)
    puts "Email sent to #{employee.email}"
  end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
miguel = MultiPaymentEmployee.new('Miguel', 'miguelkashir@gmail.com', 100000, 175, 20)
carlos = MultiPaymentEmployee.new('Carlos', 'carlospj@icloud.com', 150000, 75, 10)


employees = [josh, nizar, ted, miguel, carlos]
payroll = PayRoll.new(employees)
payroll.pay_employees