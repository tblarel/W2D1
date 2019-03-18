class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
        bonus_string = bonus.to_s
        bonus_string[0..-4]+"_"+bonus_string[-3..-1]
    end

end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss,employees)
        super(name,title,salary,boss)
        @employees = employees
    end

    def bonus(multiplier)
        bonus = 0
        @employees.each {|employee| bonus += employee.salary } 
        bonus *= multiplier
        bonus_string = bonus.to_s
        bonus_string[0..-4]+"_"+bonus_string[-3..-1]
    end
end

shawna = Employee.new("Shawna","TA",12000,"darren")
david = Employee.new("David","TA",10000,"darren")
darren = Manager.new("Darren", "TA Manager",78000,"Ned",[shawna,david])
ned = Manager.new("Ned","Founder",1000000,nil,[darren, shawna, david])


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000


