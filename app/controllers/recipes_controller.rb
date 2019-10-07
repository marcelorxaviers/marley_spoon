# frozen_string_literal: true

# Controller responsible for recipes requests
class RecipesController < ApplicationController
  OPTIONS = { content_type: 'recipe', limit: 10, order: '-sys.createdAt' }.freeze

  def index
    @recipes = recipes
    respond_to do |format|
      format.js { render 'index.js.haml' }
      format.html
    end
  end

  def show
    @recipe = Recipe.new(Contentful.client.entry(params[:id]))
  end

private

  def recipes
    options = OPTIONS.merge(skip: params[:skip].to_i)
    Contentful.client.entries(options).map { |entry| Recipe.new(entry) }
  end
end
