require "employee"

class Startup

    def initialize (name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

# getter methods

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

# other methods

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
           employees << Employee.new(employee_name, title)
        else
            raise "not a valid title"
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)  # when I used @ it worked when I took out @ it didn't

        money_owed = @salaries[employee.title]

        if funding >= money_owed
            employee.pay(money_owed)
            @funding -= money_owed
        else
            raise "not enough funding"
        end

        # if funding < salaries[employee.title]
        #     raise "not enough funding"
        # else
        #     employee.pay(salaries[employee.title])
        #     funding -= salaries[employee.title]
        # end

    end

    def payday
        employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        employees.map { |employee| @salaries[employee.title] }.sum / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end

        @employees += startup.employees
        startup.close
    end



end
