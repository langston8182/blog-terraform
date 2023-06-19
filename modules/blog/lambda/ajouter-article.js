'use strict';

const AWS = require('aws-sdk');

exports.handler = async (event, context) => {
    const documentClient = new AWS.DynamoDB.DocumentClient();

    let responseBody = "";
    let statusCode = 0;

    const {id, dateArticle, titre, titreEncoding, contenu, extensionThumbnail} = JSON.parse(event.body);
    const action = event.queryStringParameters ? event.queryStringParameters.action : "";

    const params = {
        TableName: process.env.TABLE,
        Item: {
            id: id,
            dateArticle: dateArticle,
            titre: titre,
            titreEncoding: titreEncoding,
            contenu: contenu,
            extensionThumbnail: extensionThumbnail,
            published: action === "publish" ? true : false
        }
    }

    try {
        const data = await documentClient.put(params).promise();
        responseBody = JSON.stringify(data);
        statusCode = 201;
    } catch(err) {
        responseBody = `Impossible d'ajouter l'article : ${err}`;
        statusCode = 403;
    }

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