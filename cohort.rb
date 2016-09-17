require 'date'
require 'active_support'
require 'active_support/core_ext'
require 'holidays'


class Cohort
#start day is calendar day
#end day is calendar day
#given week and day return calendar day
#generate lecture days


  def initialize(first_day)
    @first_day = first_day
  end

  def last_day
    @first_day + 8.weeks + 4.days
  end

  def no_lecture_on(day)
    day.saturday? || day.sunday? || double_check_holiday(day)
  end

  def double_check_holiday(day)
    potential_holidays = Holidays.on(day, :ca_on)
    
    if potential_holidays.any?
      potential_holidays.each do |h|
        print "Are you taking #{h} off? y/N: "
        answer = gets.chomp
        if answer.downcase == 'y'
          return true
        end
      end
    end

    return false
  end

  def class_days
    list = []
    (@first_day..last_day).each do |day|
      unless no_lecture_on(day) 
        list << day
      end
    end

    return list
  end

  def lectures
    list = []
    class_days.each_with_index do |day, index|
      list << Lecture.new(index, day)
    end

    return list
  end

end

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

