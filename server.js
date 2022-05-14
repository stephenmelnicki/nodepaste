'use strict';

const http = require('http');

const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Bonjour, le monde!');
});

server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

process.on('SIGINT', () => {
  console.log('Closing http server...');

  server.close(() => {
    console.log('Closed.');
    process.exit();
  });
});
