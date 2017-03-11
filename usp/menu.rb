require './usp/model'
require './utils/hash_utils.rb'
require './constants'
require 'time'

module USP
  class Menu < Model
    def initialize(model)
      @model ||= normalize_week model.deep_symbolize_keys
      super
    end

    def normalize_week(menu)
      menu.each_with_object({}) do |meal, o|
        date = Date.parse meal[:date]
        o[CONST::WEEK[date.wday]] = meal
      end
    end

    def [](week_day)
      if CONST::WEEK.include? week_day
        ret = model[week_day]
        ret.define_singleton_method :[] do |period|
          if CONST::PERIODS.include? period
            super(period)[:menu]
          else
            super(period)
          end
        end
        ret
      else
        super
      end
    end

    CONST::PERIODS.each do |per|
      define_method per do |week_day|
        return '' unless CONST::WEEK.include? week_day
        model[week_day][per][:menu]
      end
    end
  end
end
