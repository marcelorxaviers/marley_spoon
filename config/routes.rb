# frozen_string_literal: true

Rails.application.routes.draw do
  root 'recipes#index'

  get 'recipes/index'
end
