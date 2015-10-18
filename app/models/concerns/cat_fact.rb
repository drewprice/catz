class CatFact
  BASE_URL = 'http://catfacts-api.appspot.com/api/facts?number='

  attr_reader :facts

  def self.get(number = 1)
    return new.facts.first unless number > 1
    new(number).facts
  end

  def initialize(number = 1)
    @facts = request("#{BASE_URL}#{number}")['facts']
  end

  private

  def request(url)
    open_uri = open(url)
    json = JSON.load(open_uri)
  end
end
