
desc "export to postgresql"
task transcribe: :environment do

require 'aws-sdk-transcribeservice'
require 'aws-sdk-s3'

    Aws.config.update({
        region: 'us-east-2',
        credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_KEY'])
      })
      
client = Aws::TranscribeService::Client.new(region: 'us-east-2')

job_name = generate_activation_code()

s3 = Aws::S3::Resource.new(
    region:'us-east-2',
    access_key_id: ENV['AWS_ACCESS_KEY'],
    secret_access_key: ENV['AWS_SECRET_KEY'])

obj = s3.bucket('transcribe-job-tes').object('2019-03-29-09_11_00.mp3')
obj.upload_file('/Users/marc/Desktop/2019-03-29-09_11_00.mp3')


resp = client.start_transcription_job({
    transcription_job_name: "#{job_name}", # required
    language_code: "en-US", # required, accepts en-US, es-US, en-AU, fr-CA, en-GB, de-DE, pt-BR, fr-FR, it-IT, ko-KR
    media_format: "mp3", # required, accepts mp3, mp4, wav, flac
    media: { # required
        media_file_uri: "https://s3.us-east-2.amazonaws.com/transcribe-job-tes/2019-03-29-09_11_00.mp3",
    },
})

WaitUtil.wait_for_condition('transcribe completed', options = {:verbose => true, :timeout_sec => 300, :delay_sec => 10}) do
    resp = client.get_transcription_job({
      transcription_job_name: "#{job_name}", # required
    })
    transcribe_status = resp.transcription_job.transcription_job_status
    [transcribe_status == "COMPLETED"] 
  end
  
#   puts resp.transcription_job.transcription_job_status
  trans = resp.transcription_job.transcript.transcript_file_uri.to_json
  audi_file = JSON.parse(trans)
  puts audi_file.to_str

end

def generate_activation_code(size = 8)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
