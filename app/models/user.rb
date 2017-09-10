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

  def self.save_github_account(account_id,user_id)
    user = User.find_by(uid: user_id)
    user.update(GithubId: account_id)
  end
end
