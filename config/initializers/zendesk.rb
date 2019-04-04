require 'zendesk_api'

$client = ZendeskAPI::Client.new do |config|
  # Mandatory:

  config.url = "https://rocketelevators5722.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2

  # Basic / Token Authentication
  config.username = "marc_ant21@hotmail.com"

  # Choose one of the following depending on your authentication choice
  config.token = ENV['ZENDESK_TOKEN']
#   ENV['ZENDESK_TOKEN']
#   config.password = "your zendesk password"

  # OAuth Authentication
#   config.access_token = "5170db1870278ad9a79a24af745ac738f3f17e2a812ca915cc7f21fae5535b6a"

  # Optional:

  # Retry uses middleware to notify the user
  # when hitting the rate limit, sleep automatically,
  # then retry the request.
  config.retry = true

  # Logger prints to STDERR by default, to e.g. print to stdout:
  require 'logger'
  config.logger = Logger.new(STDOUT)

  # Changes Faraday adapter
  # config.adapter = :patron

  # Merged with the default client options hash
  # config.client_options = { :ssl => false }

  # When getting the error 'hostname does not match the server certificate'
  # use the API at https://yoursubdomain.zendesk.com/api/v2
end