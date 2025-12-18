const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.json({
        service: 'Microservice 1',
        message: 'Hello from Service 1!',
        timestamp: new Date().toISOString()
    });
});

app.get('/health', (req, res) => {
    res.json({ status: 'healthy', service: 'service1' });
});

app.listen(PORT, () => {
    console.log(`Service 1 running on port ${PORT}`);
});
