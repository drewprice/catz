module Giphy
  class Gif
    attr_reader :id, :images, :rating

    def self.new_collection(collection)
      collection.map { |obj| new(obj) }
    end

    def initialize(data = {})
      data.each { |k, v| instance_variable_set("@#{k}", v) }
      open_structize_images
    end

    def url
      images.fixed_width.url
    end

    private

    def open_structize_images
      @images.each { |k, v| @images[k] = OpenStruct.new(v) }
      @images = OpenStruct.new(@images)
    end
  end
end
