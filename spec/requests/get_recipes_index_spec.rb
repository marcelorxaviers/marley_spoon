# frozen_string_literal: true

require 'spec_helper'

describe 'Recipes', type: :request do
  let(:entry) do
    OpenStruct.new(
      id: '123',
      title: 'Delicious meal!',
      photo: OpenStruct.new(url: 'nice url here'),
      chef: OpenStruct.new(name: 'Marcelo Xavier'),
      description: 'Delicious meal made of delicious ingredients!',
      tags: [OpenStruct.new(name: 'vegan'), OpenStruct.new(name: 'vegetarian')]
    )
  end

  before do
    double('Contentful::Client').then do |mock|
      allow(mock).to receive(:entry).with(entry.id) { entry }
      allow(mock).to receive(:entries).with(any_args) { [entry] }
      allow(Contentful).to receive(:client) { mock }
    end
  end

  describe 'GET index' do
    it 'renders recipes index page with recipes data' do
      get recipes_index_path

      expect(response).to be_successful
      expect(response.body).to include(entry.id)
      expect(response.body).to include(entry.title)
      expect(response.body).to include(entry.photo.url)
    end
  end

  describe 'GET show recipe' do
    it 'renders recipes show page with recipes data' do
      get show_recipe_path(entry.id)

      expect(response).to be_successful
      expect(response.body).to include(entry.title)
      expect(response.body).to include(entry.photo.url)
      expect(response.body).to include(entry.chef.name)
      expect(response.body).to include(entry.description)
      entry.tags.each do |tag|
        expect(response.body).to include(tag.name)
      end
    end
  end
end
