class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp =  Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = '88539b925d9e9ffbf03f'
      req.params['client_secret'] = 'ce2bca798709fb5322de17682f9cf780a46bbcdd'
      req.params['query'] = 'tetris'
    end

    body_hash = JSON.parse(@resp.body)
    @repos = body_hash["items"]

    render 'search'
  end
end