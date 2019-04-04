require 'net/http'
require 'uri'
require 'json'


class WatsonController < ApplicationController

def watson

uri = URI.parse("https://stream.watsonplatform.net/text-to-speech/api/v1/synthesize")
request = Net::HTTP::Post.new(uri)
request.basic_auth("apikey", ENV["watsonApi_key"])
request.content_type = "application/json"
request["Accept"] = "audio/wav"
request.body = JSON.dump({
  "text" => "Hi #{current_user.first_name},
   There are currently #{Elevator.all.count}
   elevators deployed in the #{Building.all.count} 
   buildings of your #{Customer.all.count}
   customers Currently, #{Elevator.all.where(status: 'Offline').count}
   elevators are not in Running Status and are being serviced
   You currently have #{Quote.all.count} quotes awaiting processing
   You currently have #{Lead.all.count} leads in your contact requests
   there are #{Battery.all.count} Batteries are deployed across 
   #{Address.all.distinct.count('city')} cities
   "
})

req_options = {
  use_ssl: uri.scheme == "https",
}
# uncomment for watson response
# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
#   http.request(request)
# end
send_data response.body
end
end
