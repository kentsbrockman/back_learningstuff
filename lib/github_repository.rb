require 'octokit'

module GithubRepository

  def client
    if ENV['GITHUB_TOKEN']
      begin
        Octokit::Client.new(access_token: "#{ENV['GITHUB_TOKEN']}")
      rescue
        puts "Your Github token is not valid, please provid a valid token to run this app. More info at https://docs.cachethq.io/docs/github-oauth-token. Program aborted."
        exit
      end
    else
      puts "Authentication to github failed, token missing, please add it to your .env"
      exit
    end
    Octokit::Client.new(access_token: "#{ENV['GITHUB_TOKEN']}")
  end

  def get_repository_uri(url)
    url.slice! 'https://github.com/'
    url.slice! '.git'
    url.slice! 'github@github.com:'
    url
  end

  def get_content_json(repository_uri, path_to_file)
    begin
      coded = client.contents(repository_uri, path: path_to_file).content
      decoded = Base64.decode64(coded)
      JSON.parse(decoded)
    rescue
      puts "Couldn't get content of" + path_to_file + ", might not exist"
      return nil
    end
  end


  def get_content(repository_uri, path_to_file = "")
    begin
      coded = client.contents(repository_uri, path: path_to_file).content
      Base64.decode64(coded)
    rescue
      puts "Couldn't get content of" + path_to_file + ", might not exist"
      return nil
    end
  end

end
