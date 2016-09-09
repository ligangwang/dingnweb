var express = require('express');
var app = express();
var path = require('path');

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname, 'rubikscube/index.html'));
});

app.use(express.static(path.join(__dirname,  'rubikscube')));

app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});