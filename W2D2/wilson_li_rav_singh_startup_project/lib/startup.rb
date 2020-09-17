require "employee"

class Startup
    attr_accessor :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @employees = []
        @name = name
        @funding = funding 
        @salaries = salaries
    end

    def valid_title?(title)
        self.salaries.has_key?(title) 
    end

    def >(startup_2)
        self.funding > startup_2.funding  
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            self.employees << Employee.new(employee_name, title)
        else
            raise "title is invalid" #this just errors out
        end
    end

    def size
        self.employees.count 
    end

    def pay_employee(employee) #this takes in an employee instance
        
        if self.funding > self.salaries[employee.title]
            employee.pay(@salaries[employee.title])
            self.funding -= self.salaries[employee.title] #can't use self here either, is it because of no attr_writer?
        else 
            raise "not enough funding!"
        end

    end

    def payday 
        self.employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        self.employees.each { |employee| sum += self.salaries[employee.title] }
        sum / (self.employees.length * 1.0)
    end

    def close 
        self.employees = []
        self.funding = 0 
    end

    def acquire(startup2)
        self.funding += startup2.funding #why can't I use self here, is it because I don't have a attr_writer?

        startup2.salaries.each do |title, salary|
           self.salaries[title] = salary if !self.salaries.has_key?(title) 
        end

        self.employees += startup2.employees # arr1 + arr2 = [ele of arr1 and ele of arr2]

        startup2.close
    end

end
