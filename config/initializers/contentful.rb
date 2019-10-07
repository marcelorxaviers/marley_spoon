# frozen_string_literal: true

# Wraps the contentful client configuration
module Contentful
module_function

  CLIENT = Contentful::Client.new(
    dynamic_entries: :auto, # Enables Content Type caching.
    space: Rails.application.credentials.content_delivery_api[:space_id],
    access_token: Rails.application.credentials.content_delivery_api[:access_token],
    environment: Rails.application.credentials.content_delivery_api[:environment_id]
  )

  def client
    CLIENT
  end
end
