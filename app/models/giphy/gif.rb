module Giphy
  class Gif
    attr_reader :id, :images, :rating

    def self.new_collection(collection)
      collection.map { |e| self.new(e) }
    end

    def initialize(data = {})
      set_instance_variables(data)
      open_structize_images
      self
    end

    private

    def set_instance_variables(data)
      data.each { |k, v| instance_variable_set("@#{k}", v) }
    end

    def open_structize_images
      @images.each { |k, v| @images[k] = OpenStruct.new(v) }
      @images = OpenStruct.new(images)
    end
  end
end
