const express = require('express');
const app = express();

const port = process.env.PORT||80;

const randData = (min, max) => {
  return Math.floor(Math.random() * (max - min) + min);
};


const randFloat=(min, max, decimalPlaces) =>{  
  var rand = Math.random() < 0.5 ? ((1-Math.random()) * (max-min) + min) : (Math.random() * (max-min) + min);  // could be min or max or anything in between
  var power = Math.pow(10, decimalPlaces);
  return Math.floor(rand*power) / power;
}


const Normal = {
  steps:randData(5000,8000),
  bodyTemperature: randFloat(35.5, 37.5,1),
  bloodPressure: randData(80, 120),
  respiration: randData(12, 16),
  glucose: randData(72,140),
  heartRate: randData(60, 100),
  cholesterol: randData(125, 200),
  oxygenSaturation: randData(95, 100),
};

const asthma = {
  steps:randData(5000,8000),
  bodyTemperature: randFloat(35.5, 37.5,1),
  bloodPressure: randData(90, 120),
  respiration: randData(20, 30),
  glucose: randData(72, 140),
  heartRate: randData(60, 100),
  cholesterol: randData(125, 200),
  oxygenSaturation: randData(92, 95),
};

const hypoxemia = {
  steps:randData(5000,8000),
  bodyTemperature: randFloat(35.5, 37.5,1),
  bloodPressure: randData(90, 120),
  respiration: randData(12, 16),
  glucose: randData(72, 140),
  heartRate: randData(60, 100),
  cholesterol: randData(125, 200),
  oxygenSaturation: randData(50, 96),
};

const congenitalheartdefect= {
  steps:randData(5000,8000),
  bodyTemperature: randFloat(35.5, 37.5,1),
  bloodPressure: randData(90, 120),
  respiration: randData(12, 16),
  glucose: randData(72, 140),
  heartRate: randData(45, 60),
  cholesterol: randData(200, 270),
  oxygenSaturation: randData(95, 100),
};

const bronchiectasis= {
  steps:randData(5000,8000),
  bodyTemperature: randFloat(35.5, 37.5,1),
  bloodPressure: randData(90, 120),
  respiration: randData(40, 60),
  glucose: randData(72, 140),
  heartRate: randData(60, 100),
  cholesterol: randData(125, 200),
  oxygenSaturation: randData(95, 100),
};

const prediabetes = {
  steps:randData(5000,8000),
  bodyTemperature: randFloat(35.5, 37.5,1),
  bloodPressure: randData(90, 120),
  respiration: randData(12, 16),
  glucose: randData(140,199),
  heartRate: randData(60, 100),
  cholesterol: randData(125, 200),
  oxygenSaturation: randData(95, 100),
};

const diabetes = {
  steps:randData(5000,8000),
  bodyTemperature: randFloat(35.5, 37.5,1),
  bloodPressure: randData(90, 120),
  respiration: randData(12, 16),
  glucose: randData(200,350),
  heartRate: randData(60, 100),
  cholesterol: randData(125, 200),
  oxygenSaturation: randData(95, 100),
};

app.get('/api/normal', (req, res) => {
    res.status(200).json(Normal)
})

app.get('/api/acuteasthma', (req, res) => {
  res.status(200).json(acuteasthma)
})

app.get('/api/hypoxemia', (req, res) => {
  res.status(200).json(hypoxemia)
})

app.get('/api/congenitalheartdefect', (req, res) => {
  res.status(200).json(congenitalheartdefect)
})

app.get('/api/bronchiectasis', (req, res) => {
  res.status(200).json(bronchiectasis)
})

app.get('/api/prediabetes', (req, res) => {
  res.status(200).json(prediabetes)
})

app.get('/api/diabetes', (req, res) => {
  res.status(200).json(diabetes)
})

app.listen(port, () => console.log("server is listening to the port: ", port))

