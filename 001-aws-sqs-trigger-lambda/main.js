exports.handler = async (event) => {
  try {
    event.Records.forEach(record => {
      const messageBody = record.body;
      console.log("Received message:", messageBody);
    });

    return {
      statusCode: 200,
      body: JSON.stringify({ message: 'Message processed successfully!' })
    };
  } catch (error) {
    console.error("Error processing SQS message:", error);
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Error processing message' })
    };
  }
};
