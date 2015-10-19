class Cat < ActiveRecord::Base
  attr_reader :gif, :giphy_id

  validates :giphy_id, presence: true, uniqueness: true

  after_find :giphy_sync

  def self.from_giphy
    gif = Giphy.random(tag: 'cat', rating: 'y,g')
    new(gif: gif)
  end

  def gif=(gif)
    @gif = gif
    @giphy_id = gif.id
  end

  private

  def giphy_sync
    @gif = Giphy.find(giphy_id)
  end
end
