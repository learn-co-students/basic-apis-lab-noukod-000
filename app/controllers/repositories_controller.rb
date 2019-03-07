class RepositoriesController < ApplicationController

  def search

  end

    def github_search
      @resp =  Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['q'] = params[:query]
        req.params['client_id'] = 'c338e20ba74c99bc36b1'
        req.params['client_secret'] = '682f36ec487a08b382ca99599c541a115ca68580'
        req.params['query'] = 'tetris'
      end

      body_hash = JSON.parse(@resp.body)
      @repos = body_hash["items"]

      render 'search'
  end
end
