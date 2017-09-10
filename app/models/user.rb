class User < ApplicationRecord

  def create_user(auth)
    user.provider = auth['provider']
    user.uid = auth['uid']
    user.screen_name = auth['info']['nickname']
    user.name = auth['info']['name']
    user.token = auth.credentials.token
    user.secret = auth.credentials.secret
  end
  
end
