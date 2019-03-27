class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = "a36571b8ecd826c18b1c"
      req.params['client_secret'] = "2270fd114d170200b1e32a8e40579b983562de42"
      req.params['query'] = "malouApp"
    end
    @body_hash=JSON.parse(@resp.body)
    puts @body_hash.inspect
    render "search"
  end
end
