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
    "Validations and Associations in Rails",
    "Sessions & Authentication",
    "Planning and Thinking Through a Rails Application",
    "Teamwork with Git",
    "Testing With Rails",
    "Serving Different Representations of Data",
    "Displays & Floats in CSS",
    "Positioning & Intro to Sass",
    "JavaScript Fundamentals",
    "Intro to jQuery & DOM",
    "Events, Callbacks & Closures",
    "Client-side Applications",
    "Intro to AJAX",
    "AJAX & JSON",
    "Forms & AJAX",
    "Client-side Templating",
    "Crowdfunder, Multi-Model Forms",
    "Authentication & Authorization",
    "Environments and Sending Email",
    "Ruby Fundamentals Review",
    "Intro to Responsive Web Design",
    "Working with APIs",
    "Scheduled Tasks and Background Jobs",
    "Surprise 1",
    "Surprise 2",
    "Surprise 3",
    "Surprise 4",
    "Surprise 5",
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
