
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    #while the name is not empty, repeat this code
    while !name.empty? do
        puts "Please enter the student's cohort"
        cohort = gets.chomp
        cohort = "unknown" if cohort.empty?
        #add the student has to the array
        students << {name: name, cohort: cohort}
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
    # names.each_with_index do |student, index|
    #     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    # end
    i = 0
    until i == names.length do 
        student = names[i]
        print "#{i + 1}."
        puts (" #{student[:name]} (#{student[:cohort]} cohort)").center(50)
        i += 1
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
