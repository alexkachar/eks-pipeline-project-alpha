const express = require('express');

const app = express();
const port = process.env.PORT || 3000;
const secret = process.env.APP_SECRET || 'no-secret-configured';

app.get('/', (req, res) => {
  res.send(`
    <h1>Hello World!</h1>
    <p>EKS Pipeline Project Alpha</p>
    <p>Secret loaded: <strong>${secret ? '✓ configured' : 'not configured'}</strong></p>
  `);
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy' });
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});