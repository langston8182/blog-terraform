'use strict';
const AWS = require('aws-sdk');

exports.handler = async (event, context) => {
    const documentClient = new AWS.DynamoDB.DocumentClient();

    const {idArticle, titreEncoding} = event.pathParameters;

    let responseBody;
    let statusCode;

    let params;

    if (titreEncoding) {
        params = {
            TableName: process.env.TABLE,
            KeyConditionExpression: "#idArticle = :idArticleValue",
            ExpressionAttributeNames: {
                "#idArticle": "id",
                "#titreEncoding": "titreEncoding"
            },
            ExpressionAttributeValues: {
                ":idArticleValue": idArticle,
                ":titreEncodingValue": titreEncoding,
            },
            FilterExpression: "#titreEncoding = :titreEncodingValue"
        }
    } else {
        params = {
            TableName: process.env.TABLE,
            Key: {
                "id": idArticle
            }
        }
    }

    try {
        let data;
        if (titreEncoding) {
            data = await documentClient.query(params).promise();
        } else {
            data = await documentClient.get(params).promise();
        }
        responseBody = JSON.stringify(data);
        statusCode = 200;
    } catch (err) {
        responseBody = `Impossible de récupérer l'article : ${err}`;
        statusCode = 403;
    }

    return {
        statusCode: statusCode,
        headers: {
            "Content-Type": "application/json",
            "access-control-allow-origin": "*"
        },
        body: responseBody
    };
};
