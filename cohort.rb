require 'date'
require 'active_support'
require 'active_support/core_ext'
require 'holidays'
require_relative 'lecture'


class Cohort
#start day is calendar day
#end day is calendar day
#given week and day return calendar day
#generate lecture days
  FIRST_COFFEE_CODE_WEEK = 2
  LAST_COFFEE_CODE_WEEK = 6
  WEEKS_IN_COHORT = 9


  def initialize(first_day)
    @first_day = first_day
  end

  def last_day
    @first_day + (WEEKS_IN_COHORT - 1).weeks + 4.days
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
    @class_days ||= []

    if @class_days.empty?
      (@first_day..last_day).each do |day|
        unless no_lecture_on(day) 
          @class_days << day
        end
      end
    end

    return @class_days
  end

  def lectures
    list = []
    class_days.each_with_index do |day, index|
      list << Lecture.new(index, day)
    end

    return list
  end

  def weeks_of_cohort
    (@first_day..last_day).each_slice(7)
  end

  def week_of(day)
    week_number = 1
    weeks_of_cohort.each do |week|
      if week.include?(day)
        return week_number
      end

      week_number += 1
    end

    return nil
  end

  def coffee_code_day?(day)
    day.tuesday? || day.thursday?
  end

  def coffee_code_week?(day)
    week_of(day).between?(FIRST_COFFEE_CODE_WEEK, LAST_COFFEE_CODE_WEEK)
  end

  def coffee_code_days
    list = []

    class_days.each do |day|
      if coffee_code_week?(day) && coffee_code_day?(day)
        list << day
      end
    end

    return list
  end

end
