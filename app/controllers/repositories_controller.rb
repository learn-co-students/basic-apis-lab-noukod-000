class RepositoriesController < ApplicationController

     def search

     end

     def github_search
       @resp =  Faraday.get 'https://api.github.com/search/repositories' do |req|
         req.params['q'] = params[:query]
         req.params['client_id'] = '  Iv1.be376e136d3599af'
         req.params['client_secret'] = ' 3ee6f4f1908e18d77b664c050aa23383eaa9fdd3'
         req.params['query'] = 'tetris'
       end

       body_hash = JSON.parse(@resp.body)
       @repos = body_hash["items"]

       render 'search'
     end
   end
