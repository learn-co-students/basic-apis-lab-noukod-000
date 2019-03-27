class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = "b89bbcd8347f4776c767"
    secret = "f9f3179cee281eba79551c95962cc7b3c1078f7d"

    resp = Faraday.get("https://api.github.com/search/repositories") do |req|
      req.params["q"] = params[:query]
      req.params["client_id"] = client_id
      req.params["client_secret"] = secret
    end

    body = JSON.parse(resp.body)
    @repos = body["items"]
    render :search
  end
end
