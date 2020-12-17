# The Project module includes methods for creating, loading and viewing projects
# as well as creating and editing tasks

# reference required gems
require 'tty-prompt'
require 'tty-table'
require 'time'
require 'rainbow'
# gem setup

$tasks = 0
$task_hash = Hash.new

module Project
    @@Ttable
    @@prompt = TTY::Prompt.new
    @@task_no = 0
    
    def Project.create()
          $project_name = @@prompt.collect do
            key(:filename).ask("Enter your project file name (No spaces or special characters excluding _)", validate: /^\w*$/, default: "untitled_project")
            key(:title).ask("Enter your Project Title", default: "Untitled Project")
          end
          #initiate YAML save here somehow        
    end

    def Project.load(filename)
    end

    def Project.view
      to_do = []
      in_prog = []
      comp = []
      $task_hash.each {|key, value|
      if value[:status] == "To Do"
        to_do << key
      elsif value[:status] == "In Progress"
        in_prog << key
      else
        comp << key
      end
    }
    head = ["To Do", "In Progress", "Done"]
    table_array = Array.new
    x = [to_do.length, in_prog.length, comp.length]
    x = x.max
    for i in 0..x-1 do
      table_array << [to_do[i], in_prog[i], comp[i]]
    end
    view_table = TTY::Table.new(head,table_array)
    puts "#{$project_name[:title]} - Project Overview"
    puts view_table.render(:unicode)
    end

    def Project.date_view
    end

    def Project.new_task
      
      @@task_no += 1

      # User input and validation(alphanumeric, underscore, dash & spaces) for task name
      task_name = @@prompt.ask("Enter the task's title", validate: /^[\w\-\s]+$/, default: "Task Number #{@@task_no}")

      # Select Task Status
      status = @@prompt.select("Select the Task's status") do |menu|
        menu.choice "To Do"
        menu.choice "In Progress"
        menu.choice "Completed"
      end

      # Sets default values for tasks
      desc = false
      due_date_time = false
      priority = "Normal"
      checklist = Hash.new
      tags = ["default"]
      comments = false

      # Collects Task data via user input
      yn = @@prompt.yes?("Would you like to include a Description?")
      if yn == true
        desc = @@prompt.multiline("Description?")  
      end
      yn = @@prompt.yes?("Would you like to include a Due Date?")
      if yn == true
        due_date_time = @@prompt.ask("Enter the task's due date and time eg. January 21st 2021 1pm or DD/MM/YYYY 13:00")
        due_date_time = Time.parse(due_date_time) # Converts string into time format, very flexible with input!
      end
      yn = @@prompt.yes?("Set Task priority? (if no, default is Normal)")
      if yn == true
        priority = @@prompt.select("Set Task Priority", %w(Low Normal High Critical))
      end
      yn = @@prompt.yes?("Add a checklist?")
      while yn == true
        list_item = @@prompt.ask("Input checklist item", validate: /^[\w\-\s]+$/)
        checklist[list_item] = false
        yn = @@prompt.yes?("Add another checklist item?")
      end
      yn = @@prompt.yes?("Add a comment?")
      if yn == true
        comments = Hash.new
        comment = @@prompt.multiline("Input Task comment")
        comments[Time.new] = comment
      end
      $task_hash[task_name] = {status: status, description: desc, due: due_date_time, prority: priority, 
      checklist: checklist, tags: tags, comments: comments}
    end

    def Project.select_task
      # Error handling for no tasks
      tasks = Hash.new
      $task_hash.each_key {|key|
        tasks[key] = key
      }
      @@task = @@prompt.select("Select a Task", tasks, filter: true, per_page: 10)
    end

    def Project.view_task
      Project.select_task
      puts "\n#{$project_name[:title]} | Viewing - #{@@task}"
      puts Rainbow("\nStatus").blue + " - #{$task_hash[@@task][:status]}"
      puts Rainbow("\nDue Date").blue + " - #{$task_hash[@@task][:due].strftime("%d/%m/%Y")} at #{$task_hash[@@task][:due].strftime("%I:%M %p")}"
      puts Rainbow("\nDescription:").underline.blue
      $task_hash[@@task][:description].each { |line|
        puts "#{line}"
      }
      puts Rainbow
    end
    
    def Project.edit_task
      
    end

    def Project.delete_task
      Project.select_task
      yn = @@prompt.yes?("Are you sure you wish to delete '#{@@task}'? (non reversable)")
      if yn == true
      puts $task_hash.delete(@@task.to_s)
      end
    end

    def Project.pdf
      puts "will refer to pdf module which will use prawnpdf gem"
    end
    

end