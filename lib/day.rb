# Helper for days
class Day
  class << self
    def pad(day)
      "%02d" % day
    end
  end
end
