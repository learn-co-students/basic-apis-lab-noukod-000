class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @repo = Faraday.get('https://api.github.com/search/repositories') do |req|
        req.params['q'] = params[:query]
        req.params["client_id"] = "Iv1.22d41040f16a723e"
        req.params["client_secret"] = "dd26a6f4fb7a76a9792870ecd08d535cbc06fb5f"
      end

      if @repo.success?
        @items = JSON.parse(@repo.body)['items']
      else
        @error = JSON.parse(@repo.body)['message']
      end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end

    render :search
    
  end


end