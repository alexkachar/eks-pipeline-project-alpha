const express = require('express');

const app = express();
const port = process.env.PORT || 3000;
const secret = process.env.APP_SECRET || 'no-secret-configured';

const escapeHtml = (value) =>
  String(value)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');

app.get('/', (req, res) => {
  const hasSecret = secret !== 'no-secret-configured';

  res.send(`
    <h1>Hello World!</h1>
    <p>EKS Pipeline Project Alpha</p>
    <p>Secret loaded: <strong>${hasSecret ? 'configured' : 'not configured'}</strong></p>
    <p>Secret value: <code>${escapeHtml(secret)}</code></p>
  `);
});

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy' });
});

app.listen(port, () => {
  console.log(`App listening on port ${port}`);
});
