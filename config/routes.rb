require 'api_constraints'

LwApi::Application.routes.draw do  
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
    	resource :page_views, :only =>[:index, :show]
    end
  end
end