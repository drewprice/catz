module Giphy
  class API
    BASE_URL = 'http://api.giphy.com/v1/gifs/'
    API_KEY  = ENV["GIPHY_API_KEY"]

    def self.search(query, options = { limit: nil, offset: nil, rating: nil, fmt: nil })
      params = build_params(options.merge(q: query))
      url = BASE_URL + "search?" + params
      Giphy::Gif.new_collection(request(url))
    end

    # def self.by_id(id)
    # end

    # def self.by_ids(ids)
    # end

    # def self.translate(phrase)
    # end

    # def self.random
    # end

    # def self.trending
    # end

    class << self
      private

      def request(url)
        open_uri = open(url)
        JSON.load(open_uri)["data"]
      end

      def build_params(params)
        params.delete_if { |k, v| v.nil? }
        params.merge(api_key: API_KEY).map { |k, v| "#{k}=#{v}" }.join('&')
      end
    end
  end
end
