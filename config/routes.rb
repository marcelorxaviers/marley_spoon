# frozen_string_literal: true

Rails.application.routes.draw do
  root 'recipes#index'

  get 'recipes/index'
  get '/recipes/:id', to: 'recipes#show'
end
