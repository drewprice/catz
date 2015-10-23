class Giphy
  BASE_URL = 'http://api.giphy.com/v1/gifs/'
  API_KEY  = ENV["GIPHY_API_KEY"]

  def self.search(query, options = { limit: nil, offset: nil, rating: 'y,g', fmt: nil })
    params = build_params(options.merge(q: query))
    url = BASE_URL + 'search?' + params
    Giphy::Response.parse(request(url))
  end

  def self.by_id(id)
    params = build_params
    url = BASE_URL + "#{id}?" + params
    Giphy::Response.parse(request(url))
  end

  def self.by_ids(*ids)
    params = build_params({ ids: ids.join(',') })
    url = BASE_URL.sub(/\/$/, '?') + params
    Giphy::Response.parse(request(url))
  end

  def self.translate(phrase, options = { rating: 'y,g', fmt: nil })
    params = build_params(options.merge(s: URI.encode(phrase)))
    url = BASE_URL + 'translate?' + params
    Giphy::Response.parse(request(url))
  end

  def self.random(options = { tag: nil, rating: 'y,g', fmt: nil })
    params = build_params(options)
    url = BASE_URL + 'random?' + params
    Giphy::Response.parse(request(url))
  end

  # def self.trending
  # end

  class << self
    private

    def request(url)
      open_uri = open(url)
      JSON.load(open_uri)["data"]
    end

    def build_params(params = {})
      params.delete_if { |k, v| v.nil? }
      params.merge(api_key: API_KEY).map { |k, v| "#{k}=#{v}" }.join('&')
    end
  end
end
