const http = require("http");

const hostname = "127.0.0.1";
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader("Content-Type", "text/plain");
  res.end("Bounjour, le monde!");
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}`);
});

process.on("SIGINT", () => {
  console.log("Closing http server...");

  server.close(() => {
    console.log("Closed.");
    process.exit();
  });
});
