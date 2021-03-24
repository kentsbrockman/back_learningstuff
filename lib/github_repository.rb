require 'octokit'

module GithubRepository

  def client
    Octokit::Client.new(access_token: "#{ENV['GITHUB_TOKEN']}")
  end

  def get_repository_uri(url)
    url.slice! 'https://github.com/'
    url.slice! '.git'
    url.slice! 'github@github.com:'
    url
  end

  def get_content_json(repository_uri, path_to_file)
    # client.contents('octokit/octokit.rb', path: 'path/to/file.rb', query: {ref: 'some-other-branch'})
    coded = client.contents(repository_uri, path: path_to_file).content
    decoded = Base64.decode64(coded)
    return  JSON.parse(decoded)
  end


  def get_content(repository_uri, path_to_file = "")
    # client.contents('octokit/octokit.rb', path: 'path/to/file.rb', query: {ref: 'some-other-branch'})
    coded = client.contents(repository_uri, path: path_to_file).content
    return Base64.decode64(coded)
  end


end
