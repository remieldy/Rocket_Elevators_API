const AWS = require('aws-sdk')
AWS.config.update({region:'us-east-1'})
const transcriber = new AWS.TranscribeService()

console.log("bonjour");

var params = {
    LanguageCode: "en-US",
    Media: {
        MediaFileUri: 'https://s3.ca-central-1.amazonaws.com/week7odissey/SampleAudio_0.7mb.mp3' 
    }, 
    MediaFormat: "wav",
    TranscriptionJobName: '5MinuteTest' 
}; 

console.log("bonjour2")


console.log("bonjour3")

transcriber.startTranscriptionJob(params, (err,result) => {
    if(err) throw err;
    console.log(result);
});

console.log("bonjour4")


var params = {};
transcriber.listTranscriptionJobs(params, function(err, data) {
    if (err) console.log(err, err.stack); // an error occurred
    else console.log(data); // successful response
});

console.log("bonjour5")

/* { TranscriptionJobSummaries:
    [ { TranscriptionJobName: '5MinuteTest',
        // CreationTime: 2018-10-30T10:50:37.736Z,
        LanguageCode: 'en-US',
        TranscriptionJobStatus: 'IN_PROGRESS',
        OutputLocationType: 'SERVICE_BUCKET' } 
    ] } */