// © 2017-2021 Maksim Aniskov MaksimAniskov@gmail.com MIT License

exports.handler = async (event) => {
    const claims = event.requestContext.authorizer.claims;
    const response = `Hi! This is Backend. I know you, ${claims['cognito:username']}. Your email is ${claims.email}`;
    return {
        statusCode: '200',
        headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
        },
        body: JSON.stringify(response),
    };
};
