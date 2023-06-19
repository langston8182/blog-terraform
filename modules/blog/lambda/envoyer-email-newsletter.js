'use strict';
const AWS = require('aws-sdk');
var ses = new AWS.SES({ region: "eu-west-3" });

exports.handler = async (event, context) => {
    const documentClient = new AWS.DynamoDB.DocumentClient();

    let responseBody = "";
    let statusCode = 0;

    const params = {
        TableName: "newsletter"
    }

    try {
        const data = await documentClient.scan(params).promise();
        await envoyerEmail(data.Items);
        responseBody = JSON.stringify(data.Items);
        statusCode = 200;
    } catch(err) {
        responseBody = `Impossible de récupérer la liste des emails de la newsletter : ${err}`;
        statusCode = 403;
    };

    const response = {
        statusCode: statusCode,
        headers: {
            "Content-Type": "application/json",
            "access-control-allow-origin": "*"
        },
        body: responseBody
    };

    return response;
};

function envoyerEmail(items) {
    var emails = [];
    items.map(item => {
        emails.push(item.email);
    })
    var params = {
        Destination: {
            ToAddresses: emails
        },
        Message: {
            Body: {
                Html: {
                    Data: "test <h1>Envoie contenu newsletter</h1>"
                }
            },
            Subject: {
                Data: "Nouvel article"
            }
        },
        Source: "cyril.marchive@gmail.com"
    }

    return ses.sendEmail(params).promise();
}