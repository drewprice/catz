class Cat < ActiveRecord::Base
  attr_reader :gif

  validates :giphy_id, presence: true, uniqueness: true

  after_find :giphy_sync

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

  def giphy_sync
    @gif = Giphy.by_id(giphy_id)
  end
end
