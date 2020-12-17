# reference required gems
require 'tty-prompt'
# gem setup
prompt = TTY::Prompt.new
# referencing required modules
require_relative './project'

quit_program = false

puts "\n████████╗██████╗ ██████╗ ███╗   ███╗
╚══██╔══╝██╔══██╗██╔══██╗████╗ ████║
   ██║   ██████╔╝██████╔╝██╔████╔██║
   ██║   ██╔══██╗██╔═══╝ ██║╚██╔╝██║
   ██║   ██████╔╝██║     ██║ ╚═╝ ██║
   ╚═╝   ╚═════╝ ╚═╝     ╚═╝     ╚═╝
                                    "
puts "Welcome to Text Based Project Manager!"
on_start = prompt.select("\nWould you like to load an existing project, or create a new one\n", %w(Load Create))
if on_start == "Load"
    puts "insert load phase here"
else
    Project.create()
    initial_class = prompt.yes?("Would you like to create your project's first task?")
    if initial_class == true
        Project.new_task()
        another_task = true
        while another_task == true
            another_task = initial_class = prompt.yes?("Would you like to create another task?")
            if another_task == true
                Project.new_task()
            end
            puts $task_hash
        end
    end
end
while quit_program == false
    status = prompt.select("Current Project: #{$project_name} - Project Menu") do |menu|
        menu.choice "Project Overview"
        menu.choice "Project Overview With Due Dates"
        menu.choice "Add Task"
        menu.choice "Edit Task"
        menu.choice "Remove Task"
        menu.choice "Generate PDF"
      end


end