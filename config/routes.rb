require 'api_constraints'

LwApi::Application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  # Api definition
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
  	post '/', to: 'api_endpoint#create'
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :page_views, :only => [:show, :index, :create]
      resources :visits, :only => [:show, :index, :create]
      resources :purchases, :only => [:show, :index, :create]
    end
  end
end
