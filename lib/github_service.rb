require 'faraday'
require 'json'

class GithubService
  def self.user_info(username)
    response = conn.get("users/#{username}")
    parse_response(response)
  end

private
  def self.parse_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.github.com")
  end
end
