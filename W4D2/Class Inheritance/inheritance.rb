#employee has attributes of name, title, salary, boss(parent)= nil 
#manager will inherit from employee, will have employees array as extra instance variable
#employee class will have a bonus method, and we will call super on it it to change it in manager class
#which methods will be protected or private?
require "byebug"
class Employee

    attr_accessor :boss 
    attr_reader :salary

    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary, @boss = name, title, salary
        self.boss = boss
    end


    def bonus(multiplier)
        salary * multiplier
    end


end

class Manager < Employee 1
    
    attr_reader :employees 

    def initialize(name, title, salary)
        super #calls intialize from one up the "chain"
        @employees = []
    end

    def bonus(multiplier)
     
        queue = employees
        employee_salaries = 0
        until queue.empty?
            el = queue.shift
            employee_salaries += el.salary
            el.employees.each { |employee| queue << employee } if el.is_a?(Manager)
        end
        
        employee_salaries * multiplier 
    end

    # def hire(name, title, salary)
    #     name = Employee.new(name, title, salary)
    #     self.employees << name 
    # end

    def hire(employee)
        self.employees << employee
        employee.boss = self
    end

end