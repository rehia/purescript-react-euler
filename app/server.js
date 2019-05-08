const http = require('http');

const server = http.createServer((request, response) => {
    const number = Math.floor(Math.random() * 10000);
    response.setHeader('Content-Type', 'application/json')
    response.end(JSON.stringify({number}));
});

server.listen(3001);

console.log('API server listening on 3001...');
