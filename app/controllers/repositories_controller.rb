class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin

    response = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = "cb53135d7f813f403e0e"
      req.params["client_secret"] = "23e25c6870d866d0178f5fd796c16129ddb23ed5"
 
    end
    body_hash = JSON.parse(response.body)
    @items = body_hash["items"]
    render :search
  end
end
