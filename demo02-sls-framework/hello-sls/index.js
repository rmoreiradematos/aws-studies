module.exports.hello = async (event) => {
  console.log('Event****', JSON.stringify(event, null, 2));
  console.log('Event****', event);

  return {
    statusCode: 200,
    body: JSON.stringify(
      {
        message: 'Go Serverless v3.0! Your function executed successfully!',
        input: event,
      },
      null,
      2
    ),
  };
};
