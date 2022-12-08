class AocApi
  include HTTParty
  base_uri "adventofcode.com"

  def initialize(year, session)
    @year = year
    @options = { headers: { "Cookie" => "session=#{session}", "User-Agent" => "tadhgsmboyle@gmail.com" }, verify: false }
  end

  def get_day_input(day_number)
    self.class.get("/#{@year}/day/#{day_number}/input", @options)
  end
end
