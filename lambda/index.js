// © 2017 Maksim Aniskov MaksimAniskov@gmail.com MIT License

exports.handler = (event, context, callback) => {
    const claims = event.requestContext.authorizer.claims;
    const response = `Hi! This is Backend. I know you, ${claims['cognito:username']}. Your email is ${claims.email}`;
    callback(
        null,
        {
            statusCode: '200',
            headers: {
                'Content-Type': 'application/json',
                'Access-Control-Allow-Origin': '*',
            },
            body: JSON.stringify(response),
        }
    );
};
