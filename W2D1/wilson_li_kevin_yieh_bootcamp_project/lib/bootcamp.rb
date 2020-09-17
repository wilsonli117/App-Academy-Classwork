class Bootcamp
    attr_reader :name
    attr_reader :slogan
    attr_reader :teachers
    attr_reader :students

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers, @students = [], []
        @grades = Hash.new { |h,k| h[k] = [] }

    end

    def hire(str)
        @teachers << str
    end

    def enroll(str)
        if @students.length < @student_capacity
            @students << str 
            return true
        else
            return false
        end 
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        (@students.length/@teachers.length).to_i
    end

    def add_grade(student,grade)
        if @students.include?(student) 
            @grades[student] << grade
            true
        else 
            false
        end
    end
    
    def num_grades(student)
        @grades[student].count 
    end

    def average_grade(student)
        if @students.include?(student) && !@grades[student].empty? 
            @grades[student].sum/@grades[student].length 
        else
            nil
        end
    end
end
