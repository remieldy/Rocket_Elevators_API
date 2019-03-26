require 'twilio-ruby'
desc "test sms"
task :sms_test do
    account_sid = 'AC1f1675d2c4c2f85c512e5aa688d4e351'
    auth_token = '91a93b0e2fb5a73257fc95080d64ce85'

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages.create(
                             from: '+15877416030',
                             body: 'Benson sucks',
                             to: '+14182153301'
                           )

    puts message.sid

end