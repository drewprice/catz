class Cat < ActiveRecord::Base
  attr_reader :url

  def self.giphy(count = 1)
    gifs = Giphy::API.search('cats', limit: count, rating: 'y,g')
    gifs.map { |gif| new_from_gif(gif) }
  end

  def self.new_from_gif(gif)
    new.tap do |cat|
      cat.giphy_id = gif.id
      cat.instance_variable_set('@url', gif.url)
    end
  end
end
