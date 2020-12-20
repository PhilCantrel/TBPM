# Terminal Based Project Manager

### User Manual



## Setup

#### Downloading Ruby

To run TBPM you must have Ruby installed on your computer.

For Ruby installation instructions go [here](https://www.ruby-lang.org/en/documentation/installation/)

#### Install all needed Gems

TBPM requires the following GEMs

**tty-prompt**

To Install enter the following in your terminal:

`$ gem install tty-prompt` 

**tty-table**

To Install enter the following in your terminal:

`$ gem install tty-table` 

**rainbow**

To Install enter the following in your terminal:

`$ gem install tty-rainbow `



**Please Note**

This program works best on Linux within the native terminal. If you are running on Windows with WSL, please use the terminal within software such as VSCode for best results!



## Running the program

Navigate to the /src/ folder in terminal.

Enter the following into your terminal

`$ ruby index.rb`

The program will now start.

## Using the program

When the program runs you will first be asked if you would like to Create or Load a project. The Load feature is not currently functional, so go ahead and hit create.

You will now be prompted to create a new Project file name. This name can only contain alphanumeric characters, underscores and cannot contain spaces. This filename will be used when YAML file saves are implemented. You will then be asked to input the name of your project.

After you have created your Project, you will be prompted to make your first task. It is highly recommended that you create an initial task so you can make use of all the programs features. The program will guide you through all steps in the Task creation process.

Once you have created your first Task you will be greeted by the Project Menu.

Within the project Menu you can:

- **View the Project Overview**

  Shows all Tasks with their 'Status' in the form of a table

- **Add a Task**

  You will be prompted through the Task creation process to create another Task for your project.

- **View Task**

  Select and view any Task in your Project. Shows an expanded view of all your created tasks.

- **Edit Task**

  Edit your Task name, add and edit Task attributes and tick off completed checklist items.

  (do not use this feature without creating a task, it returns an error)

- **Remove Task**

  Remove any task in your Project



## More features coming soon!

More features are being implemented to TBPM including a Project Overview with Due Dates, Saving your projects into a YAML file for future use and PDF generation, so you can send or print your Projects.

