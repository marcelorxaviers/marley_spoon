# Defines the recipe model inside the app scope
class Recipe < SimpleDelegator
  def initialize(content_full_entry)
    super(content_full_entry)
  end

  def image_source_url
    "https:#{photo.url}"
  end

  def chef_name
    chef.name
  rescue Contentful::EmptyFieldError => _
    :unknown
  end

  def tags_string
    tags.map(&:name).join(', ')
  rescue Contentful::EmptyFieldError => _
    '-'
  end
end