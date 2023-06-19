const AWS = require('aws-sdk');
const s3 = new AWS.S3();

exports.handler = async (event, context, callback) => {
    const {idArticle} = event.pathParameters;
    const extension = event.headers['extension'];

    const paramsS3List = {
        Bucket: process.env.BUCKET,
    };
    let fichier = "";
    let mime;
    try {
        await s3.listObjects(paramsS3List, function (err, data) {
            if (err) {
                console.log("Error", err);
            } else {
                data.Contents.map(objet => {
                    const repertoire = objet.Key.split('/')[0];
                    const image = objet.Key.split('/')[1];
                    mime = `image/${image.split('.')[1]}`

                    if (repertoire === idArticle && image === `thumbnail.${extension}`) {
                        fichier = objet.Key
                    }
                })
                console.log("Success" + JSON.stringify(data));
            }
        }).promise();
    } catch (error) {
        console.log("error");
        return
    }

    await encodeBase64(fichier).then(data => {
        console.log(data.Body.toString('base64'))
        let response = {
            "statusCode": 200,
            headers: {
                "Content-Type": mime,
                "access-control-allow-origin": "*"
            },
            "body": data.Body.toString('base64')
        };
        callback(null, response);
    })


}

async function encodeBase64(fichier) {
    var params = {
        "Bucket": process.env.BUCKET,
        "Key": `${fichier}`
    }
    return s3.getObject(params).promise();
}