var express = require('express')
var app = express()
var path = require('path')
var util = require('util')
var cors = require('cors')
var bodyParser = require('body-parser')
var exec =  util.promisify(require('child_process').exec)

app.use(express.static(__dirname + '/images'))

app.use(bodyParser.urlencoded({ extended: false }))
app.use(cors())

app.post('/heater', function (req, res){
  exec('/home/debian/EOS_project/set_heater.sh ' + req.body.data)
    .then(
      res.json('Success')
    )
})

app.post('/lid', function (req, res){
  exec('/home/debian/EOS_project/set_lid.sh ' + req.body.data)
    .then(
      res.json('Success')
    )
})

app.post('/setlight', function (req, res){
  exec('/home/debian/EOS_project/set_led.sh ' + req.body.data)
    .then(
      res.json('Success')
    )
})

app.get('/humidity', function (req, res){
  exec('/home/debian/EOS_project/hih8120.bin hum')
    .then(data => {
      res.json({
        stdout: data.stdout
      })
    })
})

app.get('/temperature', function (req, res){
  exec('/home/debian/EOS_project/hih8120.bin temp')
    .then(data => {
      res.json({
        stdout: data.stdout
      })
    })
})

app.get('/light', function(req, res){
  exec('/home/debian/EOS_project/get_light_intensity.sh')
    .then(data => {
      res.json({
        stdout: data.stdout
      })
    })
})

app.put('/sendTemp', function (req, res) {


  res.json('Success')
})

app.get('/', function(req, res){
  res.sendFile(path.join(__dirname+'/index.html'))
})

app.listen(8000)
console.log('API running on port 8000')
