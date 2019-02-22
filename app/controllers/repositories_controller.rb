class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id']="8f171c30330f22cc49d2"
      req.params['client_secret']="146b2d1a95652e640ab95556c07b9b37ab3b7690"
      req.params['q']=params["query"]
    end

    @body_hash=JSON.parse(@resp.body)
    puts @body_hash.inspect
    render "search"
  end
end
