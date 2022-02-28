def interactive_menu
    
end


def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.gsub("\n","")
    # while the name is not empty, repeat this code
    while !name.empty? do
        puts "Please enter the student's cohort"
        cohort = gets.chomp
        cohort = "unknown" if cohort.empty?
        # add the student has to the array
        students << {name: name, cohort: cohort}
        students.count == 1? s = "student" : s = "students"
        puts "now we have #{students.count} #{s}"
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
    i = 0
    until i == names.length do 
        student = names[i]
        print "#{i + 1}."
        puts (" #{student[:name]} (#{student[:cohort]} cohort)").center(50)
        i += 1
    end
end

def print_by_cohort(names)
    if names.length < 0
        sort_by_cohort = {}
        names.each do |student|
            if !sort_by_cohort.include?(student[:cohort])
                sort_by_cohort[student[:cohort]] = [student[:name]]
            else
                sort_by_cohort[student[:cohort]].push(student[:name])
            end
        end
        sort_by_cohort.keys.each do |i|
            puts "#{i} Cohort: "
            sort_by_cohort[i].each { |name| puts name.center(30) }
        end
    end
end

def print_footer(names)
    print "Overall we have #{names.count}"
    puts " great students"
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)
