'use strict';
const AWS = require('aws-sdk');

exports.handler = async (event, context) => {
    const documentClient = new AWS.DynamoDB.DocumentClient();

    let responseBody = "";
    let statusCode = 0;

    const params = {
        TableName: process.env.TABLE
    }


    try {
        const data = await documentClient.scan(params).promise();
        const filteredData = data.Items.filter(item => {
            return item.published == true
        })
        responseBody = JSON.stringify(filteredData);
        statusCode = 200;
    } catch(err) {
        responseBody = `Impossible de récupérer la liste des articles : ${err}`;
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