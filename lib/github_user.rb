require './lib/github_service'

class GithubUser
  attr_reader :date_joined, :name, :followers, :login

  def initialize(username)
    github_data = GithubService.user_info(username)
    @date_joined = github_data[:created_at]
    @name = github_data[:name]
    @followers = github_data[:followers]
    @login = github_data[:login]
  end

  def report
    [greeting, username_report, creation, followers_report].join("\n")
  end

private
  def format_date(date)
    DateTime.parse(date).strftime("%B %-d, %Y")
  end

  def greeting
    "Hello #{self.name}!"
  end

  def username_report
    "Your GitHub account's username is: #{self.login}"
  end

  def creation
    "Your GitHub account was created on #{format_date(self.date_joined)}"
  end

  def followers_report
    "You have gained #{followers} followers since then"
  end
end
