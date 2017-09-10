class TweetApiController < ApplicationController

  def tweet
    require_relative '../services/parse_json_service.rb'

    user_list = User.all

    user_list.each{ |user|
      init(user.token, user.secret)
      commit_count = ParseJsonService.new.create_tweet
      update(create_text(commit_count, user.GithubId))
    }
  end

  private
  def init(user_token,user_secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "nRlCKe4Aug0qyu7CIdmYBmIxc"
      config.consumer_secret = "B02QAH13KqLC68G2hdVdPmyLbNMlfRCCOM7KFDXWK0ycdWRpO6"
      config.access_token = user_token
      config.access_token_secret = user_secret
    end
  end

  private
  def update(text)
    begin
      @client.update(text)
      redirect_to root_path
    rescue => e
      p e.message
    end
  end

  private
  def create_text(count, github_id)
    '今日はGithubに' + count.to_s + '回commitしました。https://github.com/' + github_id
  end
end
