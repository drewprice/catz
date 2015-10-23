class Giphy
  class Response
    IMAGE_SIZE = 'original'
    attr_reader :id, :images, :rating

    def self.parse(data)
      if data.empty?
        Giphy.translate('404')
      elsif data.is_a? Array
        data.map { |obj| new(obj) }
      else
        new(data)
      end
    end

    def initialize(data = {})
      data.each { |k, v| instance_variable_set("@#{k}", v) }
      open_structize_images if images
    end

    def url
      if images
        images.send(IMAGE_SIZE).url
      else
        @image_url
      end
    end

    private

    def open_structize_images
      @images.each { |k, v| @images[k] = OpenStruct.new(v) }
      @images = OpenStruct.new(@images)
    end
  end
end
