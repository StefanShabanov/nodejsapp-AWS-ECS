const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello! I`m Stefan and this was a short project on deploying node.js application on AWS ECS. Thank you for your time!\n');
});

const PORT = process.env.PORT || 8080;

server.listen(8080, ()=> {
    console.log("server started at port 8080")
})
