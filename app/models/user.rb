class User < ApplicationRecord

  def self.create_user(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.sreen_name = auth['info']['nickname']
      user.name = auth['info']['name']
      user.token = auth.credentials.token
      user.secret = auth.credentials.secret
    end
  end

end
