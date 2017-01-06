class Lecture

  LECTURE_TITLES = [
    "OS and Git Fundamentals", 
    "HTML, CSS & Box Model", 
    "Displays & Dev Tools",
    "Floats & Positioning",
    "Intro to Responsive Web Design",
    "Programming Fundamentals part 1", 
    "Programming Fundamentals part 2", 
    "Object-Oriented Programming part 1", 
    "Object-Oriented Programming part 2", 
    "How To Think Like a Developer", 
    "Debugging & Testing in Ruby", 
    "HTTP Requests and Responses", 
    "Templating & Layouts, HTML Forms & Submitting Data", 
    "Saving Your Data/Intro To Databases", 
    "Intro to Rails", 
    "Routing & Controllers", 
    "Views & Forms",
    "SQL & ORMs",
    "Validations and Migrations",
    "Data Modelling & Associations",
    "Sessions & Authentication",
    "Planning and Thinking Through a Rails Application",
    "Teamwork with Git",
    "Testing With Rails",
    "Serving Different Representations of Data",
    "JavaScript Fundamentals",
    "Intro to jQuery & DOM",
    "Events, Callbacks & Closures",
    "Intro to AJAX",
    "AJAX & JSON",
    "Forms & AJAX",
    "Crowdfunder, Multi-Model Forms",
    "Authentication & Authorization",
    "Environments and Sending Email",
    "Ruby Fundamentals Review",
    "Rails Review",
    "JS, jQuery & DOM Review",
    "Scheduled Tasks and Background Jobs",
    "Working with APIs",
    "Client-side Templating",
    "Intro to Front-End Frameworks",
    "ES2015 and Node",
    "Preparing for Interviews",
    "Deployment, Capistrano & Metrics"
  ]

  attr_reader :title, :date, :number

  def initialize(number, date)
    @number = number
    @date = date
    @title = LECTURE_TITLES[number]
  end

end
