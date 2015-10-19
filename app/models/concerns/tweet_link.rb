class TweetLink
  BASE_URL = 'https://twitter.com/intent/tweet?'

  def initialize(giphy_id)
    @giphy_id = giphy_id
  end

  def to_s
    BASE_URL + build_params
  end

  private

  attr_reader :giphy_id

  def build_params
    params.map { |k, v| "#{k}=#{v}" }.join('&')
  end

  def params
    {
      text: 'LOOK AT DIS KITTEH, U MITE LIEK IT?',
      url: "#{ENV["URL"]}cats/#{giphy_id}",
      hashtags: 'werzukittehz'
    }
  end
end
