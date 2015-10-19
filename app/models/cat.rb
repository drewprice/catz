class Cat < ActiveRecord::Base
  attr_reader :gif

  validates :giphy_id, presence: true, uniqueness: true

  after_find :giphy_sync

  def self.from_giphy
    gif = Giphy.random(tag: 'cat', rating: 'y,g')
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
