// 'use strict';
//
// const express = require('express');
// // Constants
// const PORT = 3000;
// const HOST = 'localhost';
//
// // App
// const app = express();
// app.get('/', (req, res) => {res.send('Hello world\n');});
// // app.listen(PORT, HOST);console.log(`Running on http://${HOST}:${PORT}`);
// app.listen(PORT , function() {
//   console.log('App is running!');
// });
'use strict';
const express = require('express');
// Constants
const PORT = 4000;
const HOST = 'localhost';
// App
const app = express();
app.get('/', (req, res) => {
res.send('Hello world\n');
});
// app.listen(PORT, HOST);
app.listen(PORT , function() {
  console.log('App is running!');
});
