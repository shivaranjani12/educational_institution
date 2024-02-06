// server.js
const express = require('express');
const app = express();
const port = 5000;

app.use(express.json()); // Enable JSON request body parsing

// Define your routes and controllers here

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
