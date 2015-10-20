class Cat < ActiveRecord::Base
  has_many :likes
  has_many :users, through: :likes

  attr_reader :gif, :tweet

  validates :giphy_id, presence: true, uniqueness: true

  after_find :giphy_sync
  after_initialize :build_tweet

  def self.from_giphy(giphy_id = nil)
    gif = giphy_id ? Giphy.by_id(giphy_id) : Giphy.random(tag: 'cat')
    new_from_gif(gif)
  end

  def self.new_from_gif(gif)
    new(gif: gif, giphy_id: gif.id)
  end

  def gif=(gif)
    @gif = gif
  end

  private

  def build_tweet
    @tweet = TweetLink.new(self.giphy_id)
  end

  def giphy_sync
    @gif = Giphy.by_id(giphy_id)
  end
end
