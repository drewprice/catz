class User < ActiveRecord::Base
  def self.from_oauth(auth)
    find_by(auth.slice('provider', 'uid')) || create_from_oauth(auth)
  end

  def self.create_from_oauth(auth)
    create do |user|
      user.provider = auth['provider']
      user.uid      = auth['uid']
      user.name     = auth['info']['name']
      user.nickname = auth['info']['nickname']
      user.image    = auth['info']['image']
    end
  end
end
