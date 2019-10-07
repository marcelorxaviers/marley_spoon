# frozen_string_literal: true

require 'spec_helper'

describe Recipe do
  subject { Recipe.new(content_full_entry_mock) }
  let(:content_full_entry_mock) do
    OpenStruct.new(
      id: '123',
      title: 'Delicious meal!',
      photo: OpenStruct.new(url: 'nice url here'),
      description: 'Delicious meal made of delicious ingredients!'
    )
  end

  it 'delegates id to content_full recipe object' do
    expect(subject.id).to eq content_full_entry_mock.id
  end

  it 'delegates title to content_full recipe object' do
    expect(subject.title).to eq content_full_entry_mock.title
  end

  it 'delegates description to content_full recipe object' do
    expect(subject.description).to eq content_full_entry_mock.description
  end

  it 'builds image source url from photo\'s url field' do
    expected = "https:#{content_full_entry_mock.photo.url}"
    expect(subject.image_source_url).to eq expected
  end

  context 'when chef object is present' do
    let(:content_full_entry_mock) do
      OpenStruct.new(chef: OpenStruct.new(name: 'Marcelo Xavier'))
    end

    it 'gets the name from chef object' do
      expect(subject.chef_name).to eq content_full_entry_mock.chef.name
    end
  end

  context 'when chef object is missing' do
    let(:content_full_entry_mock) do
      OpenStruct.new(chef: OpenStruct.new(name: 'Marcelo Xavier'))
    end

    before do
      allow(content_full_entry_mock).to receive(:chef).and_raise(
        Contentful::EmptyFieldError.new('Mocked error')
      )
    end

    it 'sets chef_name as unknown' do
      expect(subject.chef_name).to eq 'unknown'
    end
  end

  context 'when there are tags' do
    let(:content_full_entry_mock) do
      OpenStruct.new(
        tags: [OpenStruct.new(name: 'vegan'), OpenStruct.new(name: 'vegetarian')]
      )
    end

    it 'builds tags_string from tags names' do
      expected = content_full_entry_mock.tags.map(&:name).join(', ')
      expect(subject.tags_string).to eq expected
    end
  end

  context 'when there are no tags' do
    let(:content_full_entry_mock) do
      OpenStruct.new(
        tags: [OpenStruct.new(name: 'vegan'), OpenStruct.new(name: 'vegetarian')]
      )
    end

    before do
      allow(content_full_entry_mock).to receive(:tags).and_raise(
        Contentful::EmptyFieldError.new('Mocked error')
      )
    end

    it 'sets tags_string as dash/hyphen' do
      expect(subject.tags_string).to eq '-'
    end
  end
end
