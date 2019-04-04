require 'aws-sdk-transcribeservice'
require 'aws-sdk-s3'

Aws.config.update({
  region: 'us-east-2',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY'])
})
