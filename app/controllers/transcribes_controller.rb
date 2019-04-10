require 'aws-sdk-transcribeservice'
require 'aws-sdk-s3'
class TranscribesController < ApplicationController
    
    def transcribe
        Aws.config.update({
            region: 'us-east-2',
            credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY'])
          })
          
    client = Aws::TranscribeService::Client.new(region: 'us-east-2')

    resp = client.start_transcription_job({
        transcription_job_name: "sample-transcripti", # required
        language_code: "en-US", # required, accepts en-US, es-US, en-AU, fr-CA, en-GB, de-DE, pt-BR, fr-FR, it-IT, ko-KR
        media_sample_rate_hertz: 44100,
        media_format: "mp3", # required, accepts mp3, mp4, wav, flac
        media: { # required
            media_file_uri: "https://s3.us-east-2.amazonaws.com/transcribe-job-tes/2019-03-29-09_11_00.mp3",
        }
    })
    
    resp = client.get_transcription_job({
        transcription_job_name: "sample-transcripti", # required
      })
    end
end