class Lecture

  LECTURE_TITLES = [
    "OS and Git Fundamentals", 
    "Ruby Fundamentals part 1", 
    "Ruby Fundamentals part 2", 
    "Object-Oriented Programming part 1", 
    "Object-Oriented Programming part 2", 
    "How To Think Like a Developer", 
    "Debugging & Testing in Ruby", 
    "HTTP Requests and Responses", 
    "CSS Box Model & Templates", 
    "HTML Forms & Submitting Data", 
    "Saving Your Data/Intro To Databases", 
    "Intro to Rails", 
    "Routing & Controllers", 
    "Views & Forms",
    "SQL & ActiveRecord & Validations",
    "Validations and Migrations",
    "Data Modelling & Associations",
    "Sessions & Authentication",
    "Planning and Thinking Through a Rails Application",
    "Teamwork with Git",
    "Testing With Rails",
    "Serving Different Representations of Data",
    "Displays & Floats in CSS",
    "Positioning & Intro to Sass",
    "Intro to Responsive Web Design",
    "JavaScript Fundamentals",
    "Intro to jQuery & DOM",
    "Events, Callbacks & Closures",
    "Client-side Applications",
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
