class TweetApiController < ApplicationController

  def tweet
    require_relative '../services/parse_json_service.rb'

    init
    commit_count = ParseJsonService.new.create_tweet
    update(create_text(commit_count))
  end

  private
  def init
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "nRlCKe4Aug0qyu7CIdmYBmIxc"
      config.consumer_secret = "B02QAH13KqLC68G2hdVdPmyLbNMlfRCCOM7KFDXWK0ycdWRpO6"
      config.access_token = "772029775674155008-ULcfH540dwvTbDZtvvUvu4MmbkNt9fX"
      config.access_token_secret = "xXKEfHZMGmp5z0RKBUlEsoYLrFlIxfCStfwNHnwkFtZ2z"
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
  def create_text(count)
    '今日はGithubに' + count.to_s + '回commitしました。https://github.com/yshogo'
  end
end
