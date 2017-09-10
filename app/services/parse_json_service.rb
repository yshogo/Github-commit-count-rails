class ParseJsonService

    def create_tweet
      result = get_github_json
      get_commit_count(result)
    end

    private
    def get_github_json
      uri = URI.parse('https://api.github.com/users/yshogo/events')
      json = Net::HTTP.get(uri)

      JSON::parse(json)
    end

    private
    def get_commit_count(result_json)
      now_date = Date.today.to_time
      count = 0
      result_json.each {|json_object|
        convert_date = Time.iso8601(json_object['created_at'])

        if now_date > convert_date
          break
        end

        count += 1
      }

      count
    end
end
