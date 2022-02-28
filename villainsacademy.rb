


def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    #while the name is not empty, repeat this code
    while !name.empty? do
        #add the student has to the array
        students << {name: name, cohort: :february}
        puts "now we have #{students.count} students"
        # gets another name from the user
        name = gets.chomp
    end
    return students
end

def print_header
    puts "The students of Villains Academy"
    puts "-----------"
end

def print_names(names)
    names.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(names)
    print "Overall we have #{names.count}"
puts " great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)