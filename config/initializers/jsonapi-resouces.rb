# config/initializers/jsonapi-resouces.rb
JSONAPI.configure do |config|
  # ...
  config.json_key_format = :underscored_key
end