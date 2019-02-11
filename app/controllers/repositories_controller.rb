class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      client_id = ""
      secret = ""
      @res = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params['q'] = params[:query]
        req.params["client_id"] = client_id
        req.params["client_secret"] = secret
        #req.options.timeout = 2
      end

      if @res.success?
        @items = JSON.parse(@res.body)['items']
      else
        @error = JSON.parse(@res.body)['message']
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render :search
    
  end
end
